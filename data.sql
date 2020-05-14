
INSERT INTO Department (name, description) VALUES ('Jungle', 'Land covered with dense forest and tangled vegetation, usually in hot climates.');
INSERT INTO Building (street, "number") VALUES ('Avenue 1', 48);
INSERT INTO Room ("number", building_building_ID) VALUES (23, 1);
INSERT INTO Staff (title, name, surname, Department_Department_ID, Room_Room_ID) VALUES ('Ms', 'Anna', 'Smith', 1, 1);
INSERT INTO Staff (title, name, surname, Department_Department_ID, Room_Room_ID) VALUES ('Mr', 'Joe', 'Black', 1, 1);
INSERT INTO Cage ("number", area, Department_Department_ID) VALUES (1, 30, 1);
INSERT INTO Cage ("number", area, Department_Department_ID) VALUES (2, 60, 1);
INSERT INTO animal_type (name, characteristics) VALUES ('Python', 'a family of nonvenomous snakes found in Africa, Asia, and Australia. Among its members are some of the largest snakes in the world. Nine genera and 40 species are currently recognized');
INSERT INTO Animal (animal_id, name, birthday, Cage_Cage_ID, animal_type_animal_type_ID) VALUES (1, 'Joe', '1-JAN-2010', 1, 1);
INSERT INTO Animal (animal_id, name, birthday, Cage_Cage_ID, animal_type_animal_type_ID) VALUES (2, 'Masha', '1-JAN-2015', 2, 1);
INSERT INTO Plant (name, kind, Cage_Cage_ID) VALUES ('Aloe', 'Sukulent', 1);
INSERT INTO Cleaning (timestamp, Staff_Staff_ID, Cage_Cage_ID) VALUES ('25-DEC-2019', 1, 1);

insert into feeding (feeding_id, "date", Animal_animal_id, Staff_Staff_ID, feeding_list)
values (1, '1-JAN-2010', 1, 1,
    feedinglist(
        feeding_time(feed('Wiskas', 'Cat Food'), 100)
    )
);
insert into feeding (feeding_id, "date", Animal_animal_id, Staff_Staff_ID, feeding_list)
values (2, '13-MAY-2020', 1, 1,
    feedinglist(
        feeding_time(feed('Wiskas', 'Cat Food'), 100)
    )
);

insert into feeding (feeding_id, "date", Animal_animal_id, Staff_Staff_ID, feeding_list)
values (3, '1-JAN-2020', 2, 1,
    feedinglist(
        feeding_time(feed('Wiskas', 'Cat Food'), 100)
    )
);
insert into feeding (feeding_id, "date", Animal_animal_id, Staff_Staff_ID, feeding_list)
values (4, '1-JAN-2020', 2, 2,
    feedinglist(
        feeding_time(feed('Wiskas', 'Cat Food'), 100)
    )
);
