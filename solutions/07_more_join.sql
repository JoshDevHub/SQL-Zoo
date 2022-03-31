-- more JOIN operations

-- 1. List the films where the yr is 1962 -- showing id and title
SELECT id, title
    FROM movie
    WHERE yr = 1962;

-- 2. Give the year of citizen kane
SELECT yr
    FROM movie
    WHERE title = 'Citizen Kane';

-- 3. List all Star Trek movies, include id, title, and year. Order by year
SELECT id, title, yr
    FROM movie
    WHERE title LIKE '%Star Trek%'
    ORDER BY yr;

-- 4. What id number does Glenn Close have
SELECT id
    FROM actor
    WHERE name = 'Glenn Close';

-- 5. What is the id for the film Casablanca
SELECT id
    FROM movie
    WHERE title = 'Casablanca';

-- 6. List the castlist for Casablanca
SELECT name
    FROM casting
    JOIN actor ON actorid = actor.id
    WHERE movieid = 11768;

-- 7. Obtain the castlist for the movie Alien
SELECT name
    FROM casting
    JOIN movie ON movieid = movie.id
    JOIN actor ON actorid = actor.id
    WHERE movie.title = 'Alien';

-- 8. List the films where Harrison Ford appeared
SELECT title
    FROM casting
    JOIN actor ON actorid = actor.id
    JOIN movie ON movieid = movie.id
    WHERE actor.name = 'Harrison Ford';

-- 9. List the films where Harrison Ford did not have a starring role
SELECT title
    FROM casting
    JOIN actor ON actorid = actor.id
    JOIN movie ON movieid = movie.id
    WHERE actor.name = 'Harrison Ford' AND ord <> 1;

-- 10. List the films with the leading star for all 1962 films.
SELECT title, name
    FROM casting
    JOIN actor ON actorid = actor.id
    JOIN movie ON movieid = movie.id
    WHERE movie.yr = 1962 AND ord = 1;

-- 11. Show the year and number of movies with Rock Hudson for each year he made more than 2 movies
SELECT yr, COUNT(title) AS number_of_movies
    FROM movie
    JOIN casting ON id = casting.movieid
    JOIN actor ON casting.actorid = actor.id
    WHERE name = 'Rock Hudson'
    GROUP BY yr
    HAVING COUNT(title) > 2

-- 12. List the film and leading actor of all of Julie Andrews's films.
SELECT title, name
    FROM casting
    JOIN movie ON movieid = movie.id
    JOIN actor ON actorid = actor.id
    WHERE ord = 1 AND movie.id IN (SELECT movie.id FROM casting
                                    JOIN movie ON movieid = movie.id
                                    JOIN actor ON actorid = actor.id
                                    WHERE actor.name = 'Julie Andrews');

-- 13. Obtain a list, in alphabetical order, of actors with at least 15 starring roles
SELECT DISTINCT name
    FROM casting
    JOIN actor ON actorid = actor.id
    WHERE actorid IN (SELECT actorid FROM casting
                        WHERE ord = 1
                        GROUP BY actorid
                        HAVING COUNT(actorid) >= 15)
    ORDER BY name;

-- 14. List the films released in 1978, ordered by the number of actors in the cast, then by title
SELECT title, COUNT(actorid) AS actor_count
    FROM casting
    JOIN movie ON movieid = movie.id
    WHERE movie.yr = 1978
    GROUP BY movie.title
    ORDER BY actor_count DESC, movie.title;

-- 15. List the people who have worked with Art Garfunkel
SELECT name
    FROM casting
    JOIN actor ON actorid = actor.id
    WHERE name <> 'Art Garfunkel'
        AND movieid IN (SELECT movieid FROM movie
                        JOIN casting ON movieid = movie.id
                        JOIN actor ON actorid = actor.id
                        WHERE actor.name = 'Art Garfunkel');
