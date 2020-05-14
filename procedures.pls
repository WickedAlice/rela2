CREATE OR REPLACE PROCEDURE print_animal_birthday(
    p_animal_id NUMBER 
)
IS
  r_animal Animal%ROWTYPE;
BEGIN
  SELECT *
  INTO r_animal
  FROM Animal
  WHERE animal_id = p_animal_id;
  dbms_output.put_line(r_animal.name || ' ' || r_animal.birthday);

EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line( SQLERRM );
END;
/

CREATE OR REPLACE PROCEDURE delete_unused_animal_types
IS
    animal_type_count NUMBER;
BEGIN
FOR rec IN (SELECT animal_type_ID FROM animal_type)
    LOOP
        SELECT count(*) into animal_type_count FROM Animal WHERE animal_type_animal_type_ID = rec.animal_type_ID;
        IF (animal_type_count < 1)
            THEN DELETE FROM animal_type WHERE animal_type_ID = rec.animal_type_ID;
        END IF;
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE feedings_left_today(p_id NUMBER)
IS
    feeding_count NUMBER;
    today DATE;

BEGIN
    SELECT CURRENT_DATE into today FROM dual;
    SELECT count(*) into feeding_count FROM Feeding WHERE Animal_animal_id = p_id AND 'date' = today;
    IF (feeding_count < 3)
        THEN dbms_output.put_line('Feedings left today: ' || 3 - feeding_count);
    ELSE dbms_output.put_line('All done! See you tomorrow!');
    END IF;
END;

