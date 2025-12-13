CREATE TABLE VILLE (
    Nom_Ville VARCHAR(100) PRIMARY KEY,
    Longitude DECIMAL(9,6),
    Latitude DECIMAL(9,6),
    Region VARCHAR(100),
    Pays VARCHAR(100)
);

CREATE TABLE AGENCE_DE_VOYAGE (
    Cod_A VARCHAR(50) PRIMARY KEY,
    Site_web VARCHAR(255),
    Telephone VARCHAR(20),
    Adresse_Num_A VARCHAR(20),
    Adresse_Pays_A VARCHAR(100),
    Adresse_Rue_A VARCHAR(255),
    Adresse_Code_Postal VARCHAR(20),
    VILLE_Nom_Ville VARCHAR(100),
    FOREIGN KEY (VILLE_Nom_Ville) REFERENCES VILLE(Nom_Ville)
);


CREATE TABLE CHAMBRE (
    Cod_C VARCHAR(50) PRIMARY KEY,
    Etage INT,
    Surface DECIMAL(10,2),
    Type_Chambre VARCHAR(20) CHECK(Type_Chambre IN ('Simple', 'Double', 'Triple', 'Suite')) DEFAULT 'Simple'
);

CREATE TABLE EQUIPEMENT (
    Equipement VARCHAR(100) PRIMARY KEY
);

CREATE TABLE HAS_EQUIPEMENT (
    CHAMBRE_Cod_C VARCHAR(50),
    EQUIPEMENT_Equipement VARCHAR(100),
    PRIMARY KEY (CHAMBRE_Cod_C, EQUIPEMENT_Equipement),
    FOREIGN KEY (CHAMBRE_Cod_C) REFERENCES CHAMBRE(Cod_C),
    FOREIGN KEY (EQUIPEMENT_Equipement) REFERENCES EQUIPEMENT(Equipement)
);

CREATE TABLE SUITE (
    CHAMBRE_Cod_C VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (CHAMBRE_Cod_C) REFERENCES CHAMBRE(Cod_C)
);

CREATE TABLE ESPACES_DISPO (
    Espaces_Dispo VARCHAR(100) PRIMARY KEY
);

CREATE TABLE HAS_ESPACES_DISPO (
    SUITE_CHAMBRE_Cod_C VARCHAR(50),
    ESPACES_DISPO_Espaces_Dispo VARCHAR(100),
    PRIMARY KEY (SUITE_CHAMBRE_Cod_C, ESPACES_DISPO_Espaces_Dispo),
    FOREIGN KEY (SUITE_CHAMBRE_Cod_C) REFERENCES SUITE(CHAMBRE_Cod_C),
    FOREIGN KEY (ESPACES_DISPO_Espaces_Dispo) REFERENCES ESPACES_DISPO(Espaces_Dispo)
);

CREATE TABLE RESERVATION (
    CHAMBRE_Cod_C VARCHAR(50),
    Date_debut DATE,
    Date_fin DATE,
    Prix_journalier DECIMAL(10,2),
    AGENCE_DE_VOYAGE_Cod_A VARCHAR(50),
    PRIMARY KEY (CHAMBRE_Cod_C, Date_debut),
    FOREIGN KEY (CHAMBRE_Cod_C) REFERENCES CHAMBRE(Cod_C),
    FOREIGN KEY (AGENCE_DE_VOYAGE_Cod_A) REFERENCES AGENCE_DE_VOYAGE(Cod_A)
);

-- . Inserer les donnees
INSERT INTO VILLE VALUES
('Casablanca', -7.5898, 33.5731, 'Grand Casablanca', 'Maroc'),
('Rabat', -6.8498, 34.0209, 'Rabat-Sale-Kenitra', 'Maroc'),
('Marrakech', -8.0085, 31.6295, 'Marrakech-Safi', 'Maroc'),
('Tanger', -5.8136, 35.7595, 'Tanger-Tetouan-Al Hoceïma', 'Maroc'),
('Fes', -5.0039, 34.0331, 'Fes-Meknes', 'Maroc');

INSERT INTO AGENCE_DE_VOYAGE VALUES
('A001', 'www.voyagemaroc.ma', '+212522345678', '12', 'Maroc', 'Rue Mohammed V', '20000', 'Casablanca'),
('A002', 'www.travelmorocco.com', '+212537654321', '45', 'Maroc', 'Avenue Hassan II', '10000', 'Rabat'),
('A003', NULL, '+212524112233', '8', 'Maroc', 'Rue de la Koutoubia', '40000', 'Marrakech'),
('A004', 'www.northtravel.ma', '+212539887766', '22', 'Maroc', 'Boulevard Mohamed VI', '90000', 'Tanger'),
('A005', 'www.festravel.com', '+212535556677', '30', 'Maroc', 'Rue Boukhandiss', '30000', 'Fes');

INSERT INTO CHAMBRE VALUES
('C101', 1, 25.0, 'Simple'),
('C102', 1, 35.0, 'Double'),
('C103', 1, 45.0, 'Triple'),
('C104', 1, 55.0, 'Suite'),
('C105', 1, 28.0, 'Simple'),
('C106', 1, 38.0, 'Double'),
('C107', 1, 48.0, 'Triple'),
('C108', 1, 65.0, 'Suite'),
('C201', 2, 30.0, 'Simple'),
('C202', 2, 40.0, 'Double');

INSERT INTO EQUIPEMENT VALUES
('Minibar'),
('Jacuzzi'),
('Balcon'),
('TV ecran plat'),
('Climatisation'),
('Cuisine equipee'),
('WiFi'),
('Coffee machine'),
('Seche-cheveux'),
('Room service');

INSERT INTO HAS_EQUIPEMENT VALUES
('C101', 'TV ecran plat'),
('C101', 'Climatisation'),
('C102', 'Minibar'),
('C102', 'Balcon'),
('C103', 'Jacuzzi'),
('C104', 'Cuisine equipee'),
('C104', 'TV ecran plat'),
('C104', 'WiFi'),
('C105', 'Coffee machine'),
('C106', 'Minibar'),
('C106', 'Seche-cheveux'),
('C107', 'Balcon'),
('C108', 'Jacuzzi'),
('C108', 'Room service'),
('C201', 'TV ecran plat'),
('C202', 'Climatisation');

INSERT INTO SUITE VALUES
('C104'),
('C108');

INSERT INTO ESPACES_DISPO VALUES
('Chambre'),
('Salon'),
('Salle à manger'),
('Bureau'),
('Cuisine'),
('Salle de bain privee'),
('Terrasse');

INSERT INTO HAS_ESPACES_DISPO VALUES
('C104', 'Chambre'),
('C104', 'Salon'),
('C104', 'Salle à manger'),
('C108', 'Chambre'),
('C108', 'Bureau'),
('C108', 'Terrasse'),
('C108', 'Salle de bain privee');

INSERT INTO RESERVATION VALUES
('C101', '2025-06-01', '2025-06-05', 500.00, 'A001'),
('C102', '2025-06-10', '2025-06-15', 800.00, 'A002'),
('C103', '2025-07-01', '2025-07-07', 1200.00, 'A003'),
('C104', '2025-08-01', '2025-08-10', 3000.00, 'A001'),
('C105', '2025-06-20', '2025-06-25', 450.00, 'A002'),
('C106', '2025-07-15', '2025-07-20', 850.00, 'A004'),
('C107', '2025-08-12', '2025-08-18', 1300.00, 'A005'),
('C108', '2025-09-01', '2025-09-07', 3200.00, 'A003'),
('C201', '2025-06-05', '2025-06-10', 480.00, 'A001'),
('C202', '2025-07-22', '2025-07-28', 900.00, 'A002');


SELECT 'Base de donnees hôtel creee avec succes!' as Message;
SELECT COUNT(*) as Nombre_Chambres FROM CHAMBRE;