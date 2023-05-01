/* Insert Into Customer table */
INSERT INTO clothes_shops.customer (
                                     customer_nm,
                                     customer_surname,
                                     customer_patronymic,
                                     birth_dt,
                                     email,
                                     advertising_subscribe_flg)
VALUES ('Vitya', 'Smirnov', 'Vasilievich', '2001.12.12', 'vasya@ya.ru', TRUE);

SELECT * from clothes_shops.customer;

COPY clothes_shops.customer(
                            customer_nm,
                            customer_surname,
                            customer_patronymic,
                            birth_dt,
                            email,
                            advertising_subscribe_flg)
FROM '/private/tmp/customer.csv'
DELIMITER ','
CSV HEADER;





/* Insert Into Brand table */

INSERT INTO clothes_shops.brand (
                                 brand_nm,
                                 head_designer_nm,
                                 head_designer_surname,
                                 head_designer_patronymic,
                                 foundation_dt
)
VALUES ('Valentino', 'Pierpaolo', 'Piccioli', NULL, '01.01.1960');

SELECT * FROM clothes_shops.brand;

INSERT INTO clothes_shops.brand (
                                 brand_nm,
                                 head_designer_nm,
                                 head_designer_surname,
                                 head_designer_patronymic,
                                 foundation_dt
)
VALUES  ('Versace', 'Versace', 'Donatella', NULL, '1978.01.01'),
        ('Fendi','Jones', 'Kim', NULL, '1925.11.7'),
        ('Gucci','Michele','Alessandro',NULL,'1921.3.24'),
        ('Jacquemus','Jacquemus','Simon', NULL,'2009.2.15'),
        ('Burberry','Bailey','Christopher',NULL,'1856.9.12'),
        ('Weekday','Lasson','Louise',NULL,'2000.10.15'),
        ('Adidas','Gaudio','Paul',NULL,'1949.08.18'),
        ('Pull&Bear','Moraes','Joao',NULL,'1991.10.11'),
        ('Nike','Walker','Andy',NULL,'1964.01.25'),
        ('Converse','Russo','Philip',NULL,'1908.01.02'),
        ('Bershka','Visca','Ilaria',NULL,'1998.04.19');


SELECT * FROM clothes_shops.brand;

/* Insert Into Clothes table */

INSERT INTO clothes_shops.clothes (
                                   brand_id,
                                   clothes_nm,
                                   category_nm,
                                   color_nm,
                                   price_amt,
                                   sex_nm
)
VALUES (6, 'Kiley belted logo print dress','Dresses','Beige',60000,'female');

SELECT * FROM clothes_shops.clothes;

INSERT INTO clothes_shops.clothes (
                                   brand_id,
                                   clothes_nm,
                                   category_nm,
                                   color_nm,
                                   price_amt,
                                   sex_nm
)
VALUES  (6,'Belted mid-length car coat','Coats','Black',169000,'female'),
        (4,'Single-breasted overcoat','Coars','Dark green',206000,'male'),
        (7,'Dark T-shirt in Beige','Shirts','Beige',1300,'unisex'),
        (5,'La Robe Bahia mini dress','Dresses','Black',50280,'female'),
        (9,'Super skinny jeans in black','Jeans','Black',2100,'male'),
        (5,'Le Pantalon Santon trousers','Trousers','Black',42126,'female'),
        (12,'Organic cotton mom jean in vintage wash blue','Jeans','Blue',2300,'female'),
        (3,'Belted linen jumpsuit','Jumpsuits','Beige',285000,'female'),
        (11,'Converse Star Chevron logo t-shirt in white','Shirts','White',1700,'male'),
        (1,'Valentino x Undercover Lovers print single-breasted coat','Coats','Black',258960,'female'),
        (10,'Nike Air Running small logo short sleeve t-shirt in black','Shorts','Black',3600,'female'),
        (2,'Starfish print pleated skirt','Skirts','Multicolor',79400,'female'),
        (8,'Overdyed Premium Sweats co-ord in black','Shirts','Black',3100,'male'),
        (1,'Double-breasted blazer jacket','Jackets','Brown',202755,'female');

SELECT * FROM clothes_shops.clothes;


/* Insert Into Store table */

INSERT INTO clothes_shops.store (
                                 store_nm,
                                 create_dt,
                                 head_office_town_nm,
                                 head_office_country_nm)
VALUES  ('ASOS','2000.06.03','London','England'),
        ('SHEIN','2008.10.01','Beijing','China'),
        ('WildBerries','2004.03.14','Moscow','Russia'),
        ('Lamoda','2011.5.15','Moscow','Russia'),
        ('FARFETCH','2007.06.01','London','England');

SELECT * FROM clothes_shops.store;


/* Insert Into clothes_x_store table */

COPY clothes_shops.clothes_x_store(
                                    store_id,
                                   clothes_id,
                                   item_count
    )
FROM '/private/tmp/store_x_clothes.txt'
DELIMITER ','
CSV HEADER;

SELECT * FROM clothes_shops.clothes_x_store;



/* Insert Into delivery_point table */
INSERT INTO clothes_shops.delivery_point (
                                          store_id,
                                          street_nm,
                                          city_nm,
                                          phone_no)
VALUES (1,'Pavlov','Moscow', '89107239124'),
       (1,'Sovetskaya','Moscow', '89156784351'),
       (1,'Komsomolskaya','Tambov', '89154568912'),
       (2,'Petrovskaya','Moscow', '89107906431'),
       (2,'Novokuznetskaya','Moscow', '89159085432'),
       (2,'Dmitrovskaya','Tambov','89169043212'),
       (3,'Neglinnaya','Moscow', '89186432890'),
       (3,'Nikolskyi','Moscow', '89207432178'),
       (3,'Zapadnaya','Tambov', '89189456321'),
       (4,'Pokrovkaya','Moscow', '89107439631'),
       (4,'Volhonksaya','Moscow', '89306457641'),
       (4,'Agapkina','Tambov', '89809604562'),
       (5,'Pervomayskay','Moscow', '89179054534'),
       (5,'Lesnaya','Moscow', '89456037646'),
       (5,'Avdeeva','Tambov', '89544317841');

SELECT * FROM clothes_shops.delivery_point;



/* Insert Into Employee table */

INSERT INTO clothes_shops.employee (birth_dt)
VALUES ('1990.10.22');

INSERT INTO clothes_shops.employee (birth_dt)
VALUES  ('1987.12.21'),
        ('1990.1.5'),
        ('1986.4.17'),
        ('1984.5.8'),
        ('1999.10.2'),
        ('1983.7.11'),
        ('1982.4.17'),
        ('1989.4.1'),
        ('1993.5.17'),
        ('1988.10.14'),
        ('1985.11.13'),
        ('1988.6.9'),
        ('1980.11.9'),
        ('1986.7.8'),
        ('1991.1.12');

SELECT * FROM clothes_shops.employee;

INSERT INTO clothes_shops.employee_version (
                                     employee_id,
                                     valid_from_dttm,
                                     delivery_point_id,
                                     salary_amt,
                                     valid_to_dttm,
                                     employee_nm,
                                     employee_surname,
                                     employee_patronymic,
                                     email,
                                     position_nm)
VALUES (1, '2018-10-11 00:00:00', 2, 20000, '5999-01-01 00:00:00',
        'Sergey', 'Ershov', 'Aleksandrovich', 'ErshovSergey@gmail.com', 'Assistant'),
       (2, '2019-11-18 00:00:00', 8, 15000, '5999-01-01 00:00:00',
        'Ivan', 'Osipov', 'Zaharovich', 'OsipovIvan@mail.ru', 'Assistant'),
        (3, '2019-05-13 00:00:00', 15, 25000, '5999-01-01 00:00:00',
        'Varvara', 'Popova', 'Maksimovna', 'VarvaraPopova@gmail.com', 'Assistant'),
       (4, '2018-12-12 00:00:00', 9, 22000, '5999-01-01 00:00:00',
        'Yulia', 'Bogdanova', 'Sergeevna', 'YuliaBogdanova@gmail.com', 'Assistant'),
       (5, '2019-03-24 00:00:00', 3, 21000, '5999-01-01 00:00:00',
        'Lev', 'Belov', 'Sergeevich', 'LevBelov@mail.ru', 'Assistant'),
       (6, '2019-06-18 00:00:00', 4, 21000, '5999-01-01 00:00:00',
        'Oleg', 'Semenov', 'Petrovich', 'OlegSemenov@ya.ru', 'Assistant'),
       (7, '2019-04-07 00:00:00', 1, 17000, '5999-01-01 00:00:00',
        'Eva', 'Lazareva', 'Alexeyevna', 'EvaLazareva@ya.ru', 'Assistant'),
       (8, '2019-10-06 00:00:00', 5, 19000, '5999-01-01 00:00:00',
        'Tatyana', 'Sokolova', 'Zaharovna', 'TatyanaSokolova@ya.ru', 'Assistant'),

       (9, '2018-12-25 00:00:00', 6, 21500, '5999-01-01 00:00:00',
        'Violetta', 'Semenova', 'Davidovna', 'SemenovaVioletta@gmail.com', 'Assistant'),
       (10, '2018-05-13 00:00:00', 7, 12000, '5999-01-01 00:00:00',
        'Georgiy', 'Sidorov', 'Alexeyevich', 'SidorovGeorgiy@mail.ru', 'Assistant'),
        (11, '2018-08-19 00:00:00', 14, 30000, '5999-01-01 00:00:00',
        'Philipp', 'Popov', 'Ivanovich', 'PopovPhilipp@gmail.com', 'Assistant'),
       (12, '2019-03-17 00:00:00', 13, 28000, '5999-01-01 00:00:00',
        'Pavel', 'Lebedev', 'Zaharovich', 'LebedevPavel@gmail.com', 'Assistant'),
       (13, '2019-11-19 00:00:00', 13, 16000, '5999-01-01 00:00:00',
        'Nikita', 'Osipov', 'Aleksandrovich', 'OsipovNikita@mail.ru', 'Assistant'),
       /* versioned last position changed salaries increased */
       (14, '2018-11-15 00:00:00', 11, 19000, '2019-05-14 00:00:00',
        'Petr', 'Sidorov', 'Zaharovich', 'SidorovPetr@ya.ru', 'Assistant'),
       (15, '2018-2-18 00:00:00', 12, 27000, '2019-07-24 00:00:00',
        'Elena', 'Semenova', 'Vasilievna', 'SemenovaElena@ya.ru', 'Assistant'),
       (16, '2018-3-11 00:00:00', 13, 26000, '2019-04-03 00:00:00',
        'Oksana', 'Lebedeva', 'Zaharovna', 'LebedevaOksana@ya.ru', 'Assistant'),

       (14, '2019-05-14 00:00:00', 11, 31000, '5999-01-01 00:00:00',
        'Petr', 'Sidorov', 'Zaharovich', 'SidorovPetr@ya.ru', 'HeadAssistant'),
       (15, '2019-07-24 00:00:00', 12, 35000, '5999-01-01 00:00:00',
        'Elena', 'Semenova', 'Vasilievna', 'SemenovaElena@ya.ru', 'HeadAssistant'),
       (16, '2019-04-03 00:00:00', 13, 37000, '5999-01-01 00:00:00',
        'Oksana', 'Lebedeva', 'Zaharovna', 'LebedevaOksana@ya.ru', 'HeadAssistant');


SELECT * FROM clothes_shops.employee_version;




/* Insert Into Order table */
INSERT INTO clothes_shops.order (
                                 store_id,
                                 customer_id,
                                 delivery_dttm,
                                 purchase_dttm,
                                 delivery_point_id,
                                 buyout_flg)
VALUES (1, 5, '2019-05-14 00:00:00', '2019-05-1 00:00:00', 9, TRUE);



COPY clothes_shops.order (
                                 store_id,
                                 customer_id,
                                 delivery_dttm,
                                 purchase_dttm,
                                 delivery_point_id,
                                 buyout_flg)
FROM '/private/tmp/order.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM clothes_shops.order;


/* Insert Into Order_x_clothes table */

SELECT * FROM clothes_shops.clothes;

INSERT INTO clothes_shops.clothes_x_order (
                                           order_id,
                                           clothes_id,
                                           item_count)
VALUES (1, 8, 1);


COPY clothes_shops.clothes_x_order (
                                 order_id,
                                 clothes_id,
                                 item_count)
FROM '/private/tmp/order_x_clothes.txt'
DELIMITER ','
CSV HEADER;

SELECT * FROM clothes_shops.clothes_x_order;