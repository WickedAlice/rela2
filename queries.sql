--All animals were born since 2015 year
SELECT * FROM Animal WHERE birthday >= '1-JAN-2015';

--List of all pythons
SELECT Animal.name, Animal.birthday FROM animal_type INNER JOIN Animal ON animal_type_animal_type_ID=animal_type_ID  WHERE animal_type.name = 'Python';

--All animals have been fed May 13 
SELECT * FROM Animal WHERE EXISTS (SELECT * FROM Feeding WHERE Animal_animal_id=animal_id AND "date"='13-MAY-20');

--All animals haven’t been fed May 13
SELECT * FROM Animal WHERE NOT EXISTS (SELECT * FROM Feeding WHERE Animal_animal_id=animal_id AND "date"='13-MAY-2020');

--All Smiths and Blacks employee
SELECT * FROM Staff WHERE Surname IN ('Smith', 'Black');

--Counts of animals in each cage
SELECT COUNT(Cage_Cage_ID), Cage_Cage_ID FROM Animal GROUP BY Cage_Cage_ID; 

--All used feed names
SELECT DISTINCT fl.FEED_OBJ.title FROM feeding_list_tab fl;

--What was the animal(with id=1) feed for 13-MAY-2020
select fl.FEED_OBJ.title, amount from table
(SELECT f.feeding_list FROM Feeding f WHERE (Animal_animal_id=1 AND "date"='13-MAY-2020')) fl;

--All animals living in cages bigger than 50m^2
SELECT *
FROM Animal
WHERE Cage_Cage_ID = ANY
(SELECT Cage_ID FROM Cage WHERE area >= 50);

--All animals were fed by employee id=1
SELECT *
FROM Animal
WHERE animal_id = ALL
(SELECT Animal_animal_id FROM Feeding WHERE Staff_Staff_ID = 1);

