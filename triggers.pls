-- Before row is deleted
-- set all corresponding dependent foreign key values in plant to NULL

CREATE OR REPLACE TRIGGER plant_cage_set_null
  AFTER DELETE ON Cage
  FOR EACH ROW
BEGIN
  IF DELETING THEN
    UPDATE plant SET plant.Cage_Cage_ID = NULL
    WHERE plant.Cage_Cage_ID = :OLD.Cage_ID;
  END IF;
END;
/

-- check if animal already exists

CREATE OR REPLACE TRIGGER animal_type_check
  BEFORE INSERT OR UPDATE OF name ON animal_type
  FOR EACH ROW
DECLARE
  ExistingType            NUMBER;
  animal_type_exists  EXCEPTION;

BEGIN
  SELECT count(*) INTO ExistingType
  FROM animal_type
  WHERE name = :NEW.name;
  IF (ExistingType > 0) THEN
    RAISE animal_type_exists;
  END IF;
EXCEPTION
  WHEN animal_type_exists THEN
    Raise_application_error (
      -20300,
      'Animal type '|| TO_CHAR(:NEW.name) ||' already exists in a table animal_type'
    );
  WHEN NO_DATA_FOUND THEN
    Raise_application_error(-20322, 'Invalid сlassification');
END;
/

-- check if birthday date is in the past

CREATE OR REPLACE TRIGGER animal_birhtday_check
  BEFORE INSERT OR UPDATE OF birthday ON animal
  FOR EACH ROW
DECLARE
  invalid_birthday  EXCEPTION;
  today             DATE;

BEGIN
  SELECT CURRENT_DATE into today FROM dual;
  IF (:NEW.birthday > today) THEN
    RAISE invalid_birthday;
  END IF;
EXCEPTION
  WHEN invalid_birthday THEN
    Raise_application_error (
      -20300,
      TO_CHAR(:NEW.birthday) || ' date of birth is later then today'
    );
  WHEN NO_DATA_FOUND THEN
    Raise_application_error(-20322, 'Invalid classification');
END;
/
