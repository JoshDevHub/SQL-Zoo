-- Names

-- 1. Find the country that starts with Y
SELECT name FROM world
    WHERE name LIKE 'Y%';

-- 2. Find the countries that end with y
SELECT name FROM world
    WHERE name LIKE '%y';

-- 3. Find the countries that contain the letter X
SELECT name FROM world
    WHERE name LIKE '%x%';

-- 4. Find the countries that end with 'land'
SELECT name FROM world
    WHERE name LIKE '%land';

-- 5. Find the countries that start with C and end with ia
SELECT name FROM world
    WHERE name LIKE 'C%ia';

-- 6. Find the country with a double o in the name
SELECT name FROM world
    WHERE name LIKE '%oo%';

-- 7. Find the countries with three or more As in their names
SELECT name FROM world
    WHERE name LIKE '%a%a%a%';

-- 8. Find the countries that have 't' as the second character
SELECT name FROM world
    WHERE name LIKE '_t%'

-- 9. Find the countries that have two 'o' characters separated by two characters
SELECT name FROM world
    WHERE name LIKE '%o__o%';

-- 10. Find the countries with exactly 4 characters
SELECT name FROM world
    WHERE name LIKE '____';

-- 11. Find the country where the name is the same as its capital city's name
SELECT name FROM world
    WHERE name = capital;

-- 12. Find countries where the capital is the country plus 'City'
SELECT name FROM world
    WHERE capital = CONCAT(name, ' City');

-- 13. Find the capital and the name where the capital includes the name of the country
SELECT capital, name FROM world
    WHERE capital LIKE CONCAT('%', name, '%');