CREATE TABLE `uprawnienia` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `uprawnienia` VARCHAR(30) NOT NULL
);

CREATE TABLE `administrator` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `login` VARCHAR(50) NOT NULL,
  `hasło` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `uprawnienia_id` INT NOT NULL,
  FOREIGN KEY (`uprawnienia_id`) REFERENCES `uprawnienia`(`id`)
);

CREATE TABLE `użytkownik` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `login` VARCHAR(50) NOT NULL,
  `hasło` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `uprawnienia_id` INT NOT NULL,
  FOREIGN KEY (`uprawnienia_id`) REFERENCES `uprawnienia`(`id`)
);

CREATE TABLE `adresy_użytkowników` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `id_użytkownika` INT NOT NULL,
  `miasto` VARCHAR(50) NOT NULL,
  `ulica` VARCHAR(50) NOT NULL,
  `kod_pocztowy` VARCHAR(50) NOT NULL,
  FOREIGN KEY (`id_użytkownika`) REFERENCES `użytkownik`(`id`)
);

CREATE TABLE `kategorie` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nazwa` VARCHAR(100) NOT NULL
);

CREATE TABLE `produkty` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nazwa` VARCHAR(50) NOT NULL,
  `id_kategorii` INT NOT NULL,
  `ilość` INT NOT NULL,
  `cena_netto` INT NOT NULL,
  `cena_brutto` INT NOT NULL,
  FOREIGN KEY (`id_kategorii`) REFERENCES `kategorie`(`id`)
);

CREATE TABLE `zamówienia` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `id_użytkownika` INT NOT NULL,
  `id_adresu` INT NOT NULL,
  `id_produktu` INT NOT NULL,
  `ilość` INT NOT NULL,
  `nazwa` VARCHAR(100) NOT NULL,
  `opis` VARCHAR(500) NOT NULL,
  `data_złożenia` DATETIME NOT NULL,
  `koszt` INT NOT NULL,
  FOREIGN KEY (`id_użytkownika`) REFERENCES `użytkownik`(`id`),
  FOREIGN KEY (`id_adresu`) REFERENCES `adresy_użytkowników`(`id`),
  FOREIGN KEY (`id_produktu`) REFERENCES `produkty`(`id`)
);

CREATE TABLE `historia_zamówień` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `id_zamówienia` INT NOT NULL,
  `data_zmiany` DATETIME NOT NULL,
  `poprzedni_status` VARCHAR(50),
  `nowy_status` VARCHAR(50),
  `zmieniony_przez` VARCHAR(100),
  `komentarz` TEXT,
  FOREIGN KEY (`id_zamówienia`) REFERENCES `zamówienia`(`id`)
);
