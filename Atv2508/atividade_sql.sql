-- =====================================================
-- Atividade SQL - Tabelas COUNTRY e CITY (baseado no
-- SQL Basics Cheat Sheet - LearnSQL.com)
-- Cada tabela populada com no mínimo 30 registros (ids)
-- =====================================================

DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS country;

CREATE TABLE country (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    population INTEGER,
    area INTEGER
);

CREATE TABLE city (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INTEGER,
    population INTEGER,
    rating INTEGER,
    FOREIGN KEY (country_id) REFERENCES country(id)
);

-- ---------------------------------------------------
-- POPULA COUNTRY (30 registros)
-- ---------------------------------------------------
INSERT INTO country (id, name, population, area) VALUES
(1,  'France', 66600000, 640680),
(2,  'Germany', 80700000, 357000),
(3,  'Iceland', 350000, 103000),
(4,  'Brazil', 213000000, 8515767),
(5,  'Portugal', 10300000, 92212),
(6,  'Spain', 47400000, 505990),
(7,  'Italy', 60300000, 301340),
(8,  'United Kingdom', 67200000, 243610),
(9,  'Netherlands', 17400000, 41850),
(10, 'Belgium', 11600000, 30528),
(11, 'Switzerland', 8700000, 41290),
(12, 'Austria', 9000000, 83879),
(13, 'Poland', 37800000, 312679),
(14, 'Sweden', 10400000, 450295),
(15, 'Norway', 5400000, 385207),
(16, 'Denmark', 5800000, 42933),
(17, 'Finland', 5500000, 338424),
(18, 'Greece', 10700000, 131957),
(19, 'Ireland', 5000000, 70273),
(20, 'Argentina', 45800000, 2780400),
(21, 'Chile', 19500000, 756102),
(22, 'Peru', 33700000, 1285216),
(23, 'Colombia', 51500000, 1141748),
(24, 'Mexico', 128900000, 1964375),
(25, 'Canada', 38200000, 9984670),
(26, 'United States', 331900000, 9833517),
(27, 'Japan', 125700000, 377975),
(28, 'South Korea', 51700000, 100210),
(29, 'China', 1412000000, 9596960),
(30, 'India', 1408000000, 3287263);

-- ---------------------------------------------------
-- POPULA CITY (30 registros, ligados a country_id)
-- ---------------------------------------------------
INSERT INTO city (id, name, country_id, population, rating) VALUES
(1,  'Paris', 1, 2243000, 5),
(2,  'Berlin', 2, 3460000, 3),
(3,  'Reykjavik', 3, 128000, 4),
(4,  'Sao Paulo', 4, 12300000, 4),
(5,  'Lisboa', 5, 545000, 5),
(6,  'Manaus', 4, 2200000, 4),
(7,  'Madrid', 6, 3223000, 4),
(8,  'Roma', 7, 2873000, 5),
(9,  'London', 8, 8982000, 5),
(10, 'Amsterdam', 9, 872000, 4),
(11, 'Brussels', 10, 1200000, 3),
(12, 'Zurich', 11, 434000, 5),
(13, 'Vienna', 12, 1900000, 5),
(14, 'Warsaw', 13, 1790000, 3),
(15, 'Stockholm', 14, 975000, 4),
(16, 'Oslo', 15, 700000, 4),
(17, 'Copenhagen', 16, 644000, 5),
(18, 'Helsinki', 17, 656000, 4),
(19, 'Athens', 18, 664000, 3),
(20, 'Dublin', 19, 554000, 4),
(21, 'Buenos Aires', 20, 3075000, 4),
(22, 'Santiago', 21, 6310000, 3),
(23, 'Lima', 22, 9750000, 3),
(24, 'Bogota', 23, 7412000, 3),
(25, 'Mexico City', 24, 9200000, 4),
(26, 'Toronto', 25, 2930000, 5),
(27, 'New York', 26, 8419000, 4),
(28, 'Tokyo', 27, 13960000, 5),
(29, 'Seoul', 28, 9776000, 4),
(30, 'Beijing', 29, 21540000, 3),
(31, 'Mumbai', 30, 20411000, 3),
(32, 'Rio de Janeiro', 4, 6748000, 5);

-- =====================================================
-- 5 COMANDOS ESCOLHIDOS DA LISTA DE SQL (cheat sheet)
-- =====================================================

-- 1) COMPARISON OPERATOR: cidades com rating acima de 3
SELECT name
FROM city
WHERE rating > 3;

-- 2) TEXT OPERATOR (LIKE): cidades que comecam com 'P' ou terminam com 's'
SELECT name
FROM city
WHERE name LIKE 'P%'
   OR name LIKE '%s';

-- 3) INNER JOIN: cidade + pais correspondente
SELECT city.name, country.name
FROM city
INNER JOIN country ON city.country_id = country.id;

-- 4) LEFT JOIN: todas as cidades, mesmo sem pais correspondente
SELECT city.name, country.name
FROM city
LEFT JOIN country ON city.country_id = country.id;

-- 5) ORDER BY: nomes de cidades ordenados pelo rating (decrescente)
SELECT name
FROM city
ORDER BY rating DESC;
