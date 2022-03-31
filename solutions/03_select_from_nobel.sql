-- SELECT from Nobel

-- 1. Show all columns for the year 1950
SELECT * FROM nobel
    WHERE yr = 1950;

-- 2. Show who won the 1962 prize for Literature
SELECT winner FROM nobel
    WHERE yr = 1962 AND subject = 'Literature';

-- 3. Show the year and subject that won Albert Einstein his prize
SELECT yr, subject FROM nobel
    WHERE winner = 'Albert Einstein';

-- 4. Show the name of the Peace prize winners since 2000
SELECT winner FROM nobel
    WHERE subject = 'Peace' AND yr >= 2000;

-- 5. Show all columns for the Literature prize winners from 1980 to 1989
SELECT * FROM nobel
    WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

-- 6. Show the presidential winners
SELECT * FROM nobel
    WHERE winner IN ('Theodore Roosevelt',
                     'Woodrow Wilson',
                     'Jimmy Carter',
                     'Barack Obama');

-- 7. Show winners with the first name John
SELECT winner FROM nobel
    WHERE winner LIKE 'John %';

-- 8. Show all columns for the Physics winners for 1980 and Chemistry winners for 1984
SELECT * FROM nobel
    WHERE subject = 'Physics' AND yr = 1980
    OR subject = 'Chemistry' AND yr = 1984;

-- 9. Show all columns for the winners in 1980, excluding Chemisty and Medicine
SELECT * FROM nobel
    WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

-- 10. Show all columns for people who won the Medicine prize before 1910
-- -- Together with winners of the Literature prize from 2004 and later
SELECT * FROM nobel
    WHERE subject = 'Medicine' AND yr < 1910
    OR subject = 'Literature' AND yr >= 2004;

-- 11. Show all columns for the prize won by PETER GRÜNBERG
SELECT * FROM nobel
    WHERE winner = 'Peter Grünberg';

-- 12. Show all columns for the prize won by EUGENE O'NEILL
SELECT * FROM nobel
    WHERE winner = 'Eugene O''Neill';

-- 13. Show all columns where the winner starts with Sir.
-- -- Show the most recent first, then by name order.
SELECT * FROM nobel
    WHERE winner LIKE 'Sir %'
    ORDER BY yr DESC, winner;

-- 14. Show the 1984 winners and subject ordered by subject and winner name
-- -- But list Chemistry and Physics last
SELECT winner, subject FROM nobel
    WHERE yr = 1984
    ORDER BY subject in ('Chemistry', 'Physics'), subject, winner;
