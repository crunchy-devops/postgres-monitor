import configparser
import psycopg2
import random
import string
import time

# Lire les informations d'identification à partir du fichier de configuration
config = configparser.ConfigParser()
config.read('db_config.ini')

DB_HOST = config['postgresql']['host']
DB_NAME = config['postgresql']['database']
DB_USER = config['postgresql']['user']
DB_PASS = config['postgresql']['password']

# Connexion à la base de données PostgreSQL
connection = psycopg2.connect(
    host=DB_HOST,
    dbname=DB_NAME,
    user=DB_USER,
    password=DB_PASS
)
cursor = connection.cursor()

def random_string(length=10):
    """Génère une chaîne de caractères aléatoire."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def random_age():
    """Génère un âge aléatoire."""
    return random.randint(18, 80)

def random_city():
    """Génère un nom de ville aléatoire."""
    cities = ['Paris', 'Lyon', 'Marseille', 'Toulouse', 'Nice']
    return random.choice(cities)

def insert_random_data():
    """Insère des données aléatoires dans la table."""
    name = random_string()
    age = random_age()
    city = random_city()
    query = "INSERT INTO test_table (name, age, city) VALUES (%s, %s, %s);"
    cursor.execute(query, (name, age, city))
    connection.commit()
    print(f"Inserted: {name}, {age}, {city}")

def update_random_data():
    """Met à jour des données aléatoires dans la table."""
    new_age = random_age()
    new_city = random_city()
    query = "UPDATE test_table SET age = %s, city = %s WHERE id = (SELECT id FROM test_table ORDER BY RANDOM() LIMIT 1);"
    cursor.execute(query, (new_age, new_city))
    connection.commit()
    print(f"Updated to: {new_age}, {new_city}")

def select_random_data():
    """Sélectionne des données aléatoires de la table."""
    query = "SELECT * FROM test_table ORDER BY RANDOM() LIMIT 1;"
    cursor.execute(query)
    result = cursor.fetchone()
    print(f"Selected: {result}")

def main():
    try:
        while True:
            action = random.choice(['insert', 'update', 'select'])
            if action == 'insert':
                insert_random_data()
            elif action == 'update':
                update_random_data()
            elif action == 'select':
                select_random_data()
            
            # Pause entre les requêtes pour simuler la charge
            time.sleep(random.uniform(0.1, 1.0))

    except KeyboardInterrupt:
        print("Simulation arrêtée.")
    finally:
        cursor.close()
        connection.close()

if __name__ == '__main__':
    main()
 psycopg2
import random
import string
import time

# Configuration de la base de données
DB_HOST = 'localhost'
DB_NAME = 'votre_base_de_donnees'
DB_USER = 'votre_utilisateur'
DB_PASS = 'votre_mot_de_passe'

# Connexion à la base de données PostgreSQL
connection = psycopg2.connect(
    host=DB_HOST,
    dbname=DB_NAME,
    user=DB_USER,
    password=DB_PASS
)
cursor = connection.cursor()

def random_string(length=10):
    """Génère une chaîne de caractères aléatoire."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def random_age():
    """Génère un âge aléatoire."""
    return random.randint(18, 80)

def random_city():
    """Génère un nom de ville aléatoire."""
    cities = ['Paris', 'Lyon', 'Marseille', 'Toulouse', 'Nice']
    return random.choice(cities)

def insert_random_data():
    """Insère des données aléatoires dans la table."""
    name = random_string()
    age = random_age()
    city = random_city()
    query = "INSERT INTO test_table (name, age, city) VALUES (%s, %s, %s);"
    cursor.execute(query, (name, age, city))
    connection.commit()
    print(f"Inserted: {name}, {age}, {city}")

def update_random_data():
    """Met à jour des données aléatoires dans la table."""
    new_age = random_age()
    new_city = random_city()
    query = "UPDATE test_table SET age = %s, city = %s WHERE id = (SELECT id FROM test_table ORDER BY RANDOM() LIMIT 1);"
    cursor.execute(query, (new_age, new_city))
    connection.commit()
    print(f"Updated to: {new_age}, {new_city}")

def select_random_data():
    """Sélectionne des données aléatoires de la table."""
    query = "SELECT * FROM test_table ORDER BY RANDOM() LIMIT 1;"
    cursor.execute(query)
    result = cursor.fetchone()
    print(f"Selected: {result}")

def main():
    try:
        while True:
            action = random.choice(['insert', 'update', 'select'])
            if action == 'insert':
                insert_random_data()
            elif action == 'update':
                update_random_data()
            elif action == 'select':
                select_random_data()
            
            # Pause entre les requêtes pour simuler la charge
            time.sleep(random.uniform(0.1, 1.0))

    except KeyboardInterrupt:
        print("Simulation arrêtée.")
    finally:
        cursor.close()
        connection.close()

if __name__ == '__main__':
    main()
