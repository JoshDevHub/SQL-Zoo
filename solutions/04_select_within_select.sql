-- SELECT within SELECT

-- 1. List each country name for countries with larger populations than Russia
SELECT name FROM world
    WHERE population >
        (SELECT population FROM world
         WHERE name = 'Russia');

-- 2. List countries in Europe with a higher per capita GDP than United Kingdom
SELECT name FROM world
    WHERE gdp / population >
        (SELECT gdp / population FROM world
         WHERE name = 'United Kingdom')
        AND continent = 'Europe';

-- 3. List the name and continent of countires in the same continent with Argentina or Australia
-- -- Order by name of country
SELECT name, continent FROM world
    WHERE continent IN (SELECT continent FROM world
                        WHERE name IN ('Australia', 'Argentina')
    ORDER BY name;

-- 4. List name and population of country with greater population than Canada but less than Poland
SELECT name, population FROM world
    WHERE population > (SELECT population FROM world WHERE name = 'Canada')
        AND population < (SELECT population FROM world WHERE name = 'Poland');

-- 5. Show the name and population of each country in Europe.
-- -- Show population as a percentage of the population of Germany.
SELECT name, CONCAT(ROUND(population / (SELECT population FROM world
                                        WHERE name = 'Germany') * 100, 0) AS percentage
FROM world
    WHERE continent = 'Europe';

-- 6. Which countries have a GDP greater than every country in Europe?
SELECT name FROM world
    WHERE gdp > ALL(SELECT gdp FROM world WHERE gdp > 0 AND continent = 'Europe');

-- 7. Show largest country by area in each continent. List continent, name and area.
SELECT continent, name, area FROM world x
    WHERE area >= ALL
        (SELECT area FROM world y
         WHERE y.continent = x.continent AND area > 0);

-- 8. List each continent and the name of the country that comes first alphabetically
SELECT continent, name FROM world x
    WHERE name <= ALL(SELECT name FROM world y
                      WHERE x.continent = y.continent);

-- 9. Find the continents where all countries have a population <= 25000000. Show name, continent, population
SELECT name, continent, population FROM world x
    WHERE 25000000 >= ALL(SELECT population FROM world y
                          WHERE x.continent = y.continent);

-- 10. Find the countries with populations 3 times greater than that of all its continental neighbors
-- -- List the county and continent
SELECT name, continent FROM world x
    WHERE population > ALL(SELECT population * 3 FROM world y
                           WHERE x.continent = y.continent AND y.name <> x.name);
