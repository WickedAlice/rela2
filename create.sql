CREATE TABLE animal 
    (
    animal_id  INTEGER NOT NULL,
    name       VARCHAR2(100) NOT NULL,
    birthday   DATE NOT NULL,
    age        NUMBER,
    cage_cage_id NUMBER NOT NULL,
    animal_type_animal_type_id NUMBER NOT NULL
) 
;

ALTER TABLE animal ADD CONSTRAINT animal_pk PRIMARY KEY ( animal_id );

CREATE TABLE animal_type (
    name             VARCHAR2(100) NOT NULL,
    characteristics  CLOB,
    animal_type_id   NUMBER NOT NULL
);

ALTER TABLE animal_type ADD CONSTRAINT animal_type_pk PRIMARY KEY ( animal_type_id );

CREATE TABLE building (
    street       VARCHAR2(80) NOT NULL,
    "number"     VARCHAR2(10) NOT NULL,
    building_id  NUMBER NOT NULL
);

ALTER TABLE building ADD CONSTRAINT building_pk PRIMARY KEY ( building_id );

CREATE TABLE cage (
    cage_id                   NUMBER NOT NULL,
    "number"                  INTEGER NOT NULL,
    area                      NUMBER(2) NOT NULL,
    department_department_id  NUMBER NOT NULL
);

ALTER TABLE cage ADD CONSTRAINT cage_pk PRIMARY KEY ( cage_id );

CREATE TABLE cleaning (
    timestamp       DATE NOT NULL,
    staff_staff_id  NUMBER NOT NULL,
    cage_cage_id    NUMBER NOT NULL
);

CREATE TABLE department (
    name           VARCHAR2(80) NOT NULL,
    description    CLOB,
    department_id  NUMBER NOT NULL
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( department_id );


CREATE TABLE plant (
    name          VARCHAR2(80) NOT NULL,
    kind          VARCHAR2(80),
    cage_cage_id  NUMBER NOT NULL
);

CREATE TABLE room (
    room_id               NUMBER NOT NULL,
    "number"              VARCHAR2(100) NOT NULL,
    building_building_id  NUMBER NOT NULL
);

ALTER TABLE room ADD CONSTRAINT room_pk PRIMARY KEY ( room_id );

CREATE TABLE staff (
    title                     VARCHAR2(20),
    name                      VARCHAR2(80) NOT NULL,
    surname                   VARCHAR2(80) NOT NULL,
    staff_id                  NUMBER NOT NULL,
    department_department_id  NUMBER NOT NULL,
    room_room_id              NUMBER NOT NULL
);

ALTER TABLE staff ADD CONSTRAINT staff_pk PRIMARY KEY ( staff_id );

ALTER TABLE animal
    ADD CONSTRAINT animal_animal_type_fk FOREIGN KEY ( animal_type_animal_type_id )
        REFERENCES animal_type ( animal_type_id );

ALTER TABLE animal
    ADD CONSTRAINT animal_cage_fk FOREIGN KEY ( cage_cage_id )
        REFERENCES cage ( cage_id );

ALTER TABLE cage
    ADD CONSTRAINT cage_department_fk FOREIGN KEY ( department_department_id )
        REFERENCES department ( department_id );

ALTER TABLE cleaning
    ADD CONSTRAINT cleaning_cage_fk FOREIGN KEY ( cage_cage_id )
        REFERENCES cage ( cage_id );

ALTER TABLE cleaning
    ADD CONSTRAINT cleaning_staff_fk FOREIGN KEY ( staff_staff_id )
        REFERENCES staff ( staff_id );

ALTER TABLE plant
    ADD CONSTRAINT plant_cage_fk FOREIGN KEY ( cage_cage_id )
        REFERENCES cage ( cage_id );

ALTER TABLE room
    ADD CONSTRAINT room_building_fk FOREIGN KEY ( building_building_id )
        REFERENCES building ( building_id );

ALTER TABLE staff
    ADD CONSTRAINT staff_department_fk FOREIGN KEY ( department_department_id )
        REFERENCES department ( department_id );

ALTER TABLE staff
    ADD CONSTRAINT staff_room_fk FOREIGN KEY ( room_room_id )
        REFERENCES room ( room_id );

CREATE SEQUENCE animal_type_animal_type_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER animal_type_animal_type_id_trg BEFORE
    INSERT ON animal_type
    FOR EACH ROW
    WHEN ( new.animal_type_id IS NULL )
BEGIN
    :new.animal_type_id := animal_type_animal_type_id_seq.nextval;
END;
/

CREATE SEQUENCE building_building_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER building_building_id_trg BEFORE
    INSERT ON building
    FOR EACH ROW
    WHEN ( new.building_id IS NULL )
BEGIN
    :new.building_id := building_building_id_seq.nextval;
END;
/

CREATE SEQUENCE cage_cage_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cage_cage_id_trg BEFORE
    INSERT ON cage
    FOR EACH ROW
    WHEN ( new.cage_id IS NULL )
BEGIN
    :new.cage_id := cage_cage_id_seq.nextval;
END;
/

CREATE SEQUENCE department_department_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER department_department_id_trg BEFORE
    INSERT ON department
    FOR EACH ROW
    WHEN ( new.department_id IS NULL )
BEGIN
    :new.department_id := department_department_id_seq.nextval;
END;
/

CREATE SEQUENCE room_room_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER room_room_id_trg BEFORE
    INSERT ON room
    FOR EACH ROW
    WHEN ( new.room_id IS NULL )
BEGIN
    :new.room_id := room_room_id_seq.nextval;
END;
/

CREATE SEQUENCE staff_staff_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER staff_staff_id_trg BEFORE
    INSERT ON staff
    FOR EACH ROW
    WHEN ( new.staff_id IS NULL )
BEGIN
    :new.staff_id := staff_staff_id_seq.nextval;
END;
/


CREATE OR REPLACE TYPE feed AS OBJECT (
    title       VARCHAR2(80),
    properties  CLOB
) NOT FINAL;
/

CREATE OR REPLACE TYPE feeding_time AS OBJECT ( 
    feed_obj  feed, 
    amount    INTEGER 
) NOT FINAL;
        
/

CREATE OR REPLACE TYPE feedinglist IS
    TABLE OF feeding_time;
/

CREATE TABLE feeding (
    feeding_id        INTEGER NOT NULL,
    "date"            DATE NOT NULL,
    feeding_list      feedinglist,
    animal_animal_id  INTEGER NOT NULL,
    staff_staff_id    NUMBER NOT NULL
)
NESTED TABLE feeding_list 
 STORE AS feeding_list_tab;

ALTER TABLE feeding ADD CONSTRAINT feeding_pk PRIMARY KEY ( feeding_id );

ALTER TABLE feeding
    ADD CONSTRAINT feeding_animal_fk FOREIGN KEY ( animal_animal_id )
        REFERENCES animal ( animal_id );

ALTER TABLE feeding
    ADD CONSTRAINT feeding_staff_fk FOREIGN KEY ( staff_staff_id )
        REFERENCES staff ( staff_id );

