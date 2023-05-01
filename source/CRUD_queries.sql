/* CRUD Queries for Customer Table */

-- How many customers who are older than '2000.01.01'
SELECT count(*)
FROM clothes_shops.customer
WHERE birth_dt > '2000.01.01';

-- New user came in
INSERT INTO clothes_shops.customer(customer_nm,
                                   customer_surname,
                                   customer_patronymic,
                                   birth_dt,
                                   email,
                                   advertising_subscribe_flg
                                   )
VALUES ('Vasiliy', 'Pavlov', 'Sergeevich', '1990.03.15', 'smasher@yandex.ru', TRUE);

-- Vasiliy Pavlov decided to unfollow the advertisement
UPDATE clothes_shops.customer
    SET advertising_subscribe_flg = FALSE
WHERE customer_nm = 'Vasiliy'
        and customer_surname = 'Pavlov'
        and customer_patronymic = 'Sergeevich'
        and birth_dt = '1990.03.15'
        and email = 'smasher@yandex.ru';

-- Vasiliy Pavlov decided to delete his account
DELETE
FROM clothes_shops.customer
WHERE customer_nm = 'Vasiliy'
        and customer_surname = 'Pavlov'
        and customer_patronymic = 'Sergeevich'
        and birth_dt = '1990.03.15'
        and email = 'smasher@yandex.ru';


/* CRUD Queries for Brand Table */
SELECT * FROM clothes_shops.brand;

-- find info about Converse brand
SELECT *
FROM clothes_shops.brand
WHERE brand_nm = 'Converse';

INSERT INTO clothes_shops.brand (brand_nm,
                                 head_designer_nm,
                                 head_designer_surname,
                                 head_designer_patronymic,
                                 foundation_dt)
VALUES ('Zara', 'Numan', 'Oguzcan', NULL, '1975.01.01');

-- head desinger of Fendi changed his name to KiKim

UPDATE clothes_shops.brand
SET head_designer_nm = 'KiKim'
WHERE brand_nm = 'Fendi';


/* CRUD Queries for Clothes Table */
SELECT * FROM clothes_shops.clothes;

INSERT INTO clothes_shops.clothes(brand_id,
                                  clothes_nm,
                                  category_nm,
                                  color_nm,
                                  price_amt,
                                  sex_nm)
VALUES (9, 'Half zip fleece', 'Hoodie', 'Grey', 5000, 'male');

-- find how much clothes costs  more than 10000
SELECT count(*)
FROM clothes_shops.clothes
WHERE price_amt > 10000;

-- price amt of Dark T-shirt increased
UPDATE clothes_shops.clothes
SET price_amt = 2000
WHERE clothes_id = 4;

-- no more Half zip fleece left

DELETE
FROM clothes_shops.clothes
WHERE clothes_nm = 'Half zip fleece';


/* CRUD Queries for Store Table */

SELECT * FROM clothes_shops.store;


-- new shop added

INSERT INTO clothes_shops.store (store_nm,
                                 create_dt,
                                 head_office_town_nm,
                                 head_office_country_nm)
VALUES ('JustBuyIt', '2019.11.05', 'Moscow', 'Russia');

--WildBerries head office moved to America NewYork

UPDATE clothes_shops.store
SET head_office_country_nm = 'America', head_office_town_nm = 'NewYork'
WHERE store_nm = 'WildBerries';

-- how many shops has been created since 2010.01.01
SELECT count(*)
FROM clothes_shops.store
WHERE create_dt > '2010.01.01';




/* CRUD Queries for Delivery Point Table */

SELECT * FROM clothes_shops.delivery_point;

-- the first Lamoda store open in Barnaul city
INSERT INTO clothes_shops.delivery_point (store_id, street_nm, city_nm, phone_no)
 VALUES (4, 'Matrosova', 'Barnaul', '89168313227');


-- count how many points are there in tambov
SELECT count(*)
FROM clothes_shops.delivery_point
WHERE city_nm = 'Tambov';

--
UPDATE clothes_shops.delivery_point
SET phone_no = '89156785321'
WHERE city_nm = 'Tambov' and street_nm = 'Komsomolskaya';


/* CRUD Queries for Employee_version Table */

SELECT * FROM clothes_shops.employee_version;


-- 'Violetta', 'Semenova', 'Davidovna' got the HeadAssistant position
INSERT INTO clothes_shops.employee_version(employee_id,
                                           valid_from_dttm,
                                           delivery_point_id,
                                           salary_amt,
                                           valid_to_dttm,
                                           employee_nm,
                                           employee_surname,
                                           employee_patronymic,
                                           email,
                                           position_nm)
VALUES (9, '2019-11-13 00:00:00', 6, 21500, '5999-01-01 00:00:00',
        'Violetta', 'Semenova', 'Davidovna', 'SemenovaVioletta@gmail.com', 'HeadAssistant');

UPDATE clothes_shops.employee_version
SET valid_to_dttm = '2019-11-13 00:00:00'
WHERE employee_id = 9 and valid_from_dttm = '2018-12-25 00:00:00';


