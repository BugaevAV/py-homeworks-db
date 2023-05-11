import psycopg2
from pprint import pprint


def creating_structure(cursor):
    cursor.execute("""DROP TABLE IF EXISTS phones;
                      DROP TABLE IF EXISTS clients;""")
    cursor.execute("""
               CREATE TABLE IF NOT EXISTS clients(
               client_id SERIAL PRIMARY KEY,
               name VARCHAR(60),
               surname VARCHAR(60),
               email VARCHAR(80) UNIQUE);

               CREATE TABLE IF NOT EXISTS phones(
               id SERIAL PRIMARY KEY,
               phone_number BIGINT UNIQUE,
               client_id INTEGER REFERENCES clients(client_id));
               """)
    conn.commit()


def add_client(cursor, name, surname, email, *phone_number):
    cursor.execute("""
           INSERT INTO clients(name, surname, email) VALUES(%s, %s, %s) RETURNING client_id;
           """, (name, surname, email))
    client_id = cursor.fetchone()
    if phone_number is not None:
        for phone in phone_number:
            cursor.execute("""
                   INSERT INTO phones(phone_number, client_id) VALUES(%s, %s);
                   """, (phone, client_id))
            conn.commit()
    return f"Client {name} {surname} has been added with client_id {client_id[0]}"


def add_phone(cursor, phone_number, email):
    cursor.execute("""
            SELECT client_id, name, surname, phone_number FROM clients
            JOIN phones USING(client_id)  
            WHERE email=%s;""", (email,))
    client_data = cursor.fetchone()
    if client_data[3] is None:
        cursor.execute("""
                    UPDATE phones SET phone_number=%s WHERE client_id=%s;
                    """, (phone_number, client_data[0]))
        conn.commit()
    else:
        cursor.execute("""
                INSERT INTO phones(phone_number, client_id) VALUES(%s, %s);
                """, (phone_number, client_data[0]))
        conn.commit()
    return f"Phone number has been successfully added for client {client_data[1]} {client_data[2]}, email: {email}"


def change_data(cursor, client_id, name=None, surname=None, email=None):
    if name is not None:
        cursor.execute("""
                        UPDATE clients SET name=%s WHERE client_id=%s;
                        """, (name, client_id))
        conn.commit()
    if surname is not None:
        cursor.execute("""
                        UPDATE clients SET surname=%s WHERE client_id=%s;
                        """, (surname, client_id))
        conn.commit()
    if email is not None:
        cursor.execute("""
                        UPDATE clients SET email=%s WHERE client_id=%s;
                        """, (email, client_id))
        conn.commit()
    return f"Client data, id {client_id}, has been changed"


def delete_phone(cursor, email, *phone_number):
    res_message = ""
    for phone in phone_number:
        cursor.execute("""
                        SELECT client_id, name, surname, phone_number FROM clients
                        JOIN phones USING(client_id)  
                        WHERE email=%s AND phone_number=%s;""", (email, phone))
        client_data = cursor.fetchone()
        if client_data is None:
            res_message += f"Client with email {email} either doesn't exist or doesn't have phone_number {phone}\n"
        else:
            cursor.execute("""
                        DELETE FROM phones where phone_number=%s;
                        """, (phone,))
            conn.commit()
            res_message += f"Phone number {phone} has been successfully deleted for client {client_data[1]}" \
                           f" {client_data[2]} with email {email}\n"
    return res_message


def delete_client(cursor, client_id=None, email=None):
    cursor.execute("""
                    SELECT client_id, name, surname FROM clients  
                    WHERE client_id=%s OR email=%s;""", (client_id, email,))
    client_data = cursor.fetchone()
    cursor.execute("""
                    DELETE FROM phones WHERE client_id=%s;
                    """, (client_data[0],))
    conn.commit()
    cursor.execute("""
                    DELETE FROM clients WHERE client_id=%s;
                    """, (client_data[0],))
    conn.commit()
    return f'Client {client_data[1]} {client_data[2]}, id {client_data[0]} ' \
           f'has been successfully deleted from Data base'


def search_client(cursor, name=None, surname=None, email=None, phone=None):
    cursor.execute("""
                        SELECT client_id, name, surname, phone_number FROM clients
                        JOIN phones USING(client_id)  
                        WHERE name=%s OR surname=%s OR email=%s OR phone_number=%s;""",
                   (name, surname, email, phone))
    client_data = cursor.fetchall()
    return client_data


with open('credentials.txt', 'r', encoding='utf-8') as file:
    user = file.readline().strip()
    password = file.read().strip()

conn = psycopg2.connect(database='Clients_personal_data', user=user, password=password)
with conn.cursor() as cur:

    creating_structure(cur)
    client1 = add_client(cur, 'Алексей', 'Иванов', 'aivanov@mail.ru', None)
    print(client1)
    client2 = add_client(cur, 'Сергей', 'Петров', 'spetrov@mail.ru', None)
    print(client2)
    client3 = add_client(cur, 'Мария', 'Петрова', 'Mpetrova@gmail.ru', 89053330030)
    print(client3)
    client4 = add_client(cur, 'Ольга', 'Сидорова', 'osidorova@gmail.com', 89053330040, 89053330041, 89053330042)
    print(client4)
    client5 = add_client(cur, 'Ольга', 'Самокатова', 'osamokatova@gmail.ru', 89053330050, 89053330051)
    print(client5)

    # phone_num1 = add_phone(cur, 89053330010, 'aivanov@mail.ru')
    # print(phone_num1)
    # phone_num2 = add_phone(cur, 89053330020, 'spetrov@mail.ru')
    # print(phone_num2)
    # phone_num3 = add_phone(cur, 89053330043, 'osidorova@gmail.com')
    # print(phone_num3)
    #
    # change1 = change_data(cur, 4, surname='Иванова')
    # print(change1)
    # change2 = change_data(cur, 3, name='Василий', surname='Безпринципных', email='changegender@gmail.com' )
    # print(change2)
    # change3 = change_data(cur, 5, email='tigrenokforever@yandex.ru')
    # print(change3)
    #
    # delete1 = delete_phone(cur, 'osidorova@gmail.com', 89053330040)
    # print(delete1)
    # delete2 = delete_phone(cur, 'osidorova@gmail.com', 89053330041, 89053330042)
    # print(delete2)
    # delete3 = delete_phone(cur, 'Mpetrova@gmail.ru', 89053884846)
    # print(delete3)
    # delete4 = delete_phone(cur, 'GMotociklova@mail.ru', 89053330030)
    # print(delete4)
    #
    # del_client1 = delete_client(cur, client_id=3)
    # print(del_client1)
    # del_client2 = delete_client(cur, email='spetrov@mail.ru')
    # print(del_client2)
    # del_client3 = delete_client(cur, client_id=5)
    # print(del_client3)

    search1 = search_client(cur, name='Ольга')
    pprint(search1)
    search2 = search_client(cur, email='spetrov@mail.ru')
    pprint(search2)

conn.close()
