--Select the words not start with 'h'
SELECT * 
FROM words
WHERE word NOT LIKE 'h%';
--Select the words not end with 't'
SELECT * 
FROM words
WHERE word NOT LIKE '%t';
--Select the words not contain 'a'
SELECT * 
FROM words
WHERE word NOT LIKE '%a%';
--SELECT the words start with any character, not followed by at
SELECT * 
FROM words
WHERE word NOT LIKE '_at%';
--NOT REGEXP_LIKE Condition
--Select the words starting with any character, not followed by 'a' or 'o' or 'i'
SELECT * 
FROM words
WHERE NOT REGEXP_LIKE(word,'[_aoi](*)');
SELECT * FROM workers;
