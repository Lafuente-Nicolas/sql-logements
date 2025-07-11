DROP DATABASE location_logements;
CREATE DATABASE location_logements;
-- USE location_logements;
\c location_logements

DROP TABLE Utilisateur;
DROP TABLE Logement;
DROP TABLE Reservation;

CREATE TABLE Utilisateur(
    id SERIAL PRIMARY KEY,
    nom_Utilisateur VARCHAR(100) NOT NULL,
    prenom_Utilisateur VARCHAR (100) NOT NULL,
    date_naissance_Utilisateur DATE NOT NULL,
    tel_Utilisateur VARCHAR(10),
    cni_Utilisateur VARCHAR(15) NOT NULL,
    cp_Utilisateur VARCHAR(5) NOT NULL,
    mail_Utilisateur VARCHAR(100) NOT NULL,
    rue_Utilisateur VARCHAR(100) NOT NULL,
    numero_rue_Utilisateur INT NOT NULL,
    ville_Utilisateur VARCHAR(50) NOT NULL,
    role_Utilisateur VARCHAR(10) NOT NULL
);

CREATE TABLE Logement(
    id SERIAL PRIMARY KEY,
    id_Utilisateur INTEGER NOT NULL,
    type_Logement VARCHAR(15) NOT NULL,
    prix_location_jour INT NOT NULL,
    reserve BOOLEAN NOT NULL,
    superficie INT NOT NULL,
    nombre_piece INT NOT NULL,
    rue_Logement VARCHAR(100) NOT NULL,
    description_Logement TEXT,
    numero_rue_Logement INT NOT NULL,
    cp_Logement VARCHAR(5) NOT NULL,
    ville_Logement VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_Utilisateur) REFERENCES Utilisateur(id)
);

CREATE TABLE Reservation(
    id SERIAL PRIMARY KEY,
    id_Utilisateur INTEGER NOT NULL,
    id_Logement INTEGER NOT NULL,
    date_Reservation DATE NOT NULL,
    nombre_jour INT NOT NULL,
    FOREIGN KEY (id_Utilisateur) REFERENCES Utilisateur(id),
    FOREIGN KEY (id_Logement) REFERENCES Logement(id)
);

INSERT INTO Utilisateur (nom_Utilisateur, prenom_Utilisateur, date_Naissance_Utilisateur, tel_Utilisateur, cp_Utilisateur, mail_Utilisateur, cni_Utilisateur, rue_Utilisateur, numero_rue_Utilisateur, ville_Utilisateur, role_Utilisateur) VALUES

-- Clients
('Martin', 'Sophie', '1985-03-15', '0123456789', '59000', 'sophie.martin@email.com', 'FR1234567890', 'Rue de la Paix', '12', 'Valenciennes', 'client'),

('Dubois', 'Pierre', '1992-07-22', '0145678901', '59300', 'pierre.dubois@gmail.com', 'FR2345678901', 'Avenue des Tilleuls', '45', 'Anzin', 'client'),

('Lefebvre', 'Marie', '1978-11-08', '0167890123', '59100', 'marie.lefebvre@outlook.com', 'FR3456789012', 'Boulevard Harpignies', '8', 'Roubaix', 'client'),

('Bernard', 'Thomas', '1990-05-14', '0189012345', '59800', 'thomas.bernard@yahoo.fr', 'FR4567890123', 'Place du Marché', '3', 'Lille', 'client'),

('Moreau', 'Julie', '1987-09-30', '0190123456', '59200', 'julie.moreau@hotmail.com', 'FR5678901234', 'Rue Victor Hugo', '25', 'Tourcoing', 'client'),

-- Bailleurs
('Rousseau', 'Jean', '1975-02-18', '0198765432', '59000', 'jean.rousseau@immobilier.com', 'FR6789012345', 'Avenue de la République', '67', 'Valenciennes', 'bailleur'),

('Leroy', 'Catherine', '1982-12-03', '0187654321', '59100', 'catherine.leroy@patrimoine.fr', 'FR7890123456', 'Rue Jean Jaurès', '89', 'Roubaix', 'bailleur'),

('Garnier', 'Philippe', '1970-06-25', '0176543210', '59300', 'philippe.garnier@invest.com', 'FR8901234567', 'Boulevard Clemenceau', '15', 'Anzin', 'bailleur'),

('Faure', 'Isabelle', '1988-04-12', '0165432109', '59800', 'isabelle.faure@gestion.fr', 'FR9012345678', 'Place de la Gare', '33', 'Lille', 'bailleur'),

('Simon', 'Michel', '1965-08-07', '0154321098', '59200', 'michel.simon@proprietes.com', 'FR0123456789', 'Rue de Tournai', '52', 'Tourcoing', 'bailleur');

INSERT INTO Logement (id_Utilisateur, type_Logement, prix_location_jour, reserve, superficie, nombre_piece, rue_Logement, description_Logement, numero_rue_Logement, cp_Logement, ville_Logement)
VALUES
(1, 'Appartement', 75, false, 45, 2, 'Rue de la Paix', 'Appartement cosy en plein centre-ville', 12, '75002', 'Paris'),
(2, 'Maison', 120, false, 90, 4, 'Rue des Lilas', 'Maison spacieuse avec jardin', 5, '69003', 'Lyon'),
(3, 'Studio', 50, true, 25, 1, 'Avenue Victor Hugo', 'Petit studio idéal pour étudiant', 48, '13008', 'Marseille'),
(1, 'Villa', 250, false, 150, 6, 'Chemin des Oliviers', 'Villa luxueuse avec piscine', 2, '06000', 'Nice'),
(2, 'Appartement', 80, true, 55, 3, 'Boulevard Saint-Germain', 'Appartement lumineux proche de toutes commodités', 34, '75005', 'Paris');

INSERT INTO Reservation (id_Utilisateur, id_Logement, date_Reservation, nombre_jour)
VALUES
(3, 1, '2025-07-15', 3),
(1, 3, '2025-08-01', 7),
(2, 4, '2025-07-20', 2),
(3, 2, '2025-09-05', 5),
(1, 5, '2025-07-25', 4);

-- Sélectionner uniquement les logements réservés
SELECT * FROM Logement WHERE reserve = true;

-- Sélectionner les propriétaires et voir leurs logements
SELECT nom_Utilisateur, rue_logement FROM Utilisateur JOIN Logement ON Utilisateur.id = Logement.id_Utilisateur;

-- Sélectionner les clients ayant pris une réservation
SELECT Utilisateur.id as id_utilisateur, nom_Utilisateur, Reservation.id as id_reservation, date_Reservation FROM Utilisateur JOIN Reservation ON Utilisateur.id = Reservation.id_utilisateur;

-- Sélectionner le nombre de réservations par ville
SELECT COUNT(*) as nb_reservation_par_ville, ville_Logement FROM Reservation INNER JOIN Logement ON Logement.id = Reservation.id_logement GROUP BY ville_Logement;

-- Réservations d'un utilisateur donné (Sophie Martin - id 1)
SELECT Reservation.*, nom_Utilisateur FROM Reservation JOIN Utilisateur ON Reservation.id_Utilisateur = Utilisateur.id WHERE Utilisateur.id = 1;

-- 