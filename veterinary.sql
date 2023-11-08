CREATE DATABASE veterinary;

 CREATE TABLE owners( 
    ownerid INT PRIMARY KEY, 
    ofirstname VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL, 
    phone VARCHAR(15) NOT NULL,
    olastname VARCHAR(50) NOT NULL, 
    address VARCHAR(15) NOT NULL, 
    email VARCHAR(100) NOT NULL );

   CREATE TABLE animals(
   animalid INT PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   species VARCHAR(50) NOT NULL,
   breed VARCHAR(50) NOT NULL,
   dateofbirth DATE,
   gender VARCHAR(10) NOT NULL,
   color VARCHAR(50) NOT NULL,
   ownerid INT,foreign key (ownerid) references owners(ownerid));

CREATE TABLE Appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES Animals(animalid)
);

CREATE TABLE Doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    speciality VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices(
   invoiceid INT PRIMARY KEY,
   paymentdate TIME,
   totalamount NUMERIC(10,2) NOT NULL,
   appointid INT,
   foreign key (appointid) references appointments(appointid));

CREATE TABLE MedicalRecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate TIMESTAMP,
    doctorid INT,
    diagnosis TEXT,
    prescription TEXT,
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES Animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
    (1, 'Juan', 'Dela Cruz', '123 Main St, Manila', '123-456-7890', 'juan@example.com'),
    (2, 'Maria', 'Santos', '456 Eim St, Quezon City', '987-654-3210', 'maria@example.com'),
    (3, 'Antonio', 'Gonzales', '789 Oak St, Cebu', '555-123-45678', 'antonio@example.com'),
    (4, 'Elena', 'Rodriguez', '345 Pine St, Davao', '777-888-9999', 'elena@example.com'),
    (5, 'Ricardo', 'Lim', '987 Cedar St, Makati', '222-333-4444', 'ricardo@example.com'),
    (6, 'Isabela', 'Reyes', '111 Acacia St, Pasig', '999-000-1111', 'isabel@example.com'),
    (7, 'Luis', 'Torres', '555 Maple St, Mandaluyong', '123-555-7777', 'luis@example.com'),
    (8, 'Carmen', 'Fernandez', '222 Birch St, Taguig', '333-222-1111', 'carmen@example.com'),
    (9, 'Pedro', 'Santillian', '888 Spruce St, Bacolod', '888-777-3333', 'pedro@example.com'),
    (10, 'Sofia', 'Villianueva', '777 Walnut St, Iloilo', '111-999-3333', 'sofia@example.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Fido', 'Dog', 'Golden Retriever', '2018-03-15', 'Male', 'Golden', 1),
(2, 'Whiskers', 'Cat', 'Siamese', '2019-07-20', 'Female', 'Cream', 2),
(3, 'Rocky', 'Dog', 'German Shepherd', '2017-05-10', 'Male', 'Black and Tan', 3),
(4, 'Fluffy', 'Cat', 'Persian', '2020-01-30', 'Male', 'White', 4),
(5, 'Luna', 'Dog', 'Larbrador Retriever', '2019-11-25', 'Female', 'Yellow', 5),
(6, 'Mochi', 'Cat', 'Maine Coon', '2018-09-12', 'Male', 'Brown Tabby', 6),
(7, 'Bella', 'Dog', 'Poodle', '2020-04-05', 'Female', 'White', 7),
(8, 'Simba', 'Cat', 'Bengal', '2018-06-18', 'Male', 'Spotted Rosetted', 8),
(9, 'Max', 'Dog', 'Dachshund', '2020-07-14', 'Male', 'Black and Tan', 9),
(10,'Cleo', 'Cat', 'Ragdoll', '2019-12-22', 'Female', 'Seal Point', 10);

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD COLUMN registereddate DATE;

ALTER TABLE invoices
RENAME COLUMN paymentdate TO paymenttime;

DELETE FROM invoices
WHERE appointid = (
	SELECT appointid 
	FROM appointments 
	WHERE animalid = (
		SELECT animalid 
		FROM animals WHERE name = 'Simba'));

UPDATE doctors
SET dlastname = 'Reyes-Gonzales'
WHERE dfirstname = 'Dr. Sofia';