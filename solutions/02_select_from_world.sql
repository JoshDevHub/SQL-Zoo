-- SELECT from world

-- 1. List the name, continent, and population of all countries
SELECT name, continent, population FROM world;

-- 2. List the name of the countries that have a population of at least 200 million
SELECT name FROM world
    WHERE population >= 200000000;

-- 3. Give the name and per capita GDP for those countries with a population of at least 200 million
SELECT name, gdp / population AS per_capita_gdp
    FROM world
    WHERE population >= 200000000;

-- 4. List the name and population in millions for countries in South America
SELECT name, population / 1000000 AS population_in_millions
    FROM world
    WHERE continent = 'South America';

-- 5. List the name and population for France, Germany, and Italy
SELECT name, population FROM world
    WHERE name in ('France', 'Germany', 'Italy');

-- 6. List the countries which have a name including 'United'
SELECT name FROM world
    WHERE name LIKE '%United%';

-- 7. List countries with a population greater than 250 million or area greater than 3 million sq km.
SELECT name, population, area FROM world
    WHERE area > 3000000 OR population > 250000000;

-- 8. List countries with either a population greater than 250 million or area greater than 3 million sq km.
-- -- The country can NOT have both
SELECT name, population, area FROM world
    WHERE area > 3000000 XOR population > 250000000;

-- 9. List South American countries with population in millions and GDP in billions rounded to two decimal places.
SELECT name,
       ROUND(population / 1000000, 2) AS population_in_millions,
       ROUND(gdp / 1000000000, 2) AS gdp_in_billions
    FROM world
    WHERE continent = 'South America';

-- 10. List per-capita GDP for trillion dollar countries to the nearest $1000
SELECT name, ROUND(gdp/population, -3) AS per_capita_gdp
    FROM world
    WHERE gdp >= 1000000000000;

-- 11. List countries and their capitals where the name and capital have the same length
SELECT name, capital
    FROM world
    WHERE LENGTH(capital) = LENGTH(name);

-- 12. List countries and capitals where the first letters match but they're not the same word
SELECT name, capital
    FROM world
    WHERE LEFT(capital, 1) = LEFT(name, 1) AND name <> capital;

-- 13. Select country names that have all five vowels but no spaces
SELECT name FROM world
    WHERE (name LIKE '%a%'
       AND name LIKE '%e%'
       AND name LIKE '%i%'
       AND name LIKE '%o%'
       AND name LIKE '%u%'
       AND name NOT LIKE '% %');