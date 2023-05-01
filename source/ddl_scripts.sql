CREATE SCHEMA IF NOT EXISTS clothes_shops;

CREATE TABLE IF NOT EXISTS clothes_shops.customer (
  customer_id                BIGSERIAL PRIMARY KEY,
  customer_nm                VARCHAR(40) NOT NULL,
  customer_surname           VARCHAR(40) NOT NULL,
  customer_patronymic        VARCHAR(40),
  birth_dt                   DATE,
  email                      VARCHAR(50) NOT NULL,
  advertising_subscribe_flg  BOOLEAN
);

/* We don't need overall_transaction_amt we can find it ourselves

ALTER TABLE clothes_shops.customer DROP COLUMN overall_transactions_amt;
SELECT * FROM clothes_shops.customer;

   */

CREATE TABLE IF NOT EXISTS clothes_shops.brand (
  brand_id                  BIGSERIAL PRIMARY KEY,
  brand_nm                  VARCHAR(40) NOT NULL,
  head_designer_nm          VARCHAR(40) NOT NULL,
  head_designer_surname     VARCHAR(40) NOT NULL,
  head_designer_patronymic  VARCHAR(40),
  foundation_dt             DATE
);

CREATE TABLE IF NOT EXISTS clothes_shops.clothes (
  clothes_id          BIGSERIAL PRIMARY KEY,
  brand_id            BIGINT REFERENCES clothes_shops.brand(brand_id),
  clothes_nm          VARCHAR(100) NOT NULL,
  category_nm         VARCHAR(40) NOT NULL,
  color_nm            VARCHAR(40),
  price_amt           BIGINT NOT NULL,
  sex_nm              VARCHAR(40)
);

ALTER TABLE clothes_shops.clothes
    ADD CONSTRAINT Sex_check
        CHECK ( sex_nm = 'male' or sex_nm = 'female' or sex_nm = 'unisex');



CREATE TABLE IF NOT EXISTS clothes_shops.store (
  store_id                 BIGSERIAL PRIMARY KEY,
  store_nm                 VARCHAR(60) NOT NULL,
  create_dt                DATE,
  head_office_town_nm      VARCHAR(40),
  head_office_country_nm   VARCHAR(40)
);

/* Renamed and check

ALTER TABLE clothes_shops.store RENAME head_office_address TO head_office_town_nm;

SELECT * from clothes_shops.store;

*/

CREATE TABLE IF NOT EXISTS clothes_shops.delivery_point (
  delivery_point_id      BIGSERIAL PRIMARY KEY,
  store_id               BIGINT REFERENCES clothes_shops.store(store_id),
  street_nm              VARCHAR(40),
  city_nm                VARCHAR(40),
  phone_no               VARCHAR(15)
);



CREATE TABLE IF NOT EXISTS clothes_shops.clothes_x_store (
  store_id          BIGINT REFERENCES clothes_shops.store(store_id),
  clothes_id        BIGINT REFERENCES clothes_shops.clothes(clothes_id),
  item_count        INT CHECK ( item_count >= 0 ),
  CONSTRAINT PK_clothes_x_store PRIMARY KEY (store_id, clothes_id)
);

CREATE TABLE IF NOT EXISTS clothes_shops.employee (
  employee_id      BIGSERIAL PRIMARY KEY,
  birth_dt         DATE
);


CREATE TABLE IF NOT EXISTS clothes_shops.employee_version (
  employee_id           BIGINT REFERENCES clothes_shops.employee(employee_id),
  valid_from_dttm       TIMESTAMP,
  delivery_point_id     BIGINT REFERENCES clothes_shops.delivery_point(delivery_point_id),
  salary_amt            INT CHECK ( salary_amt >= 0 ),
  valid_to_dttm         TIMESTAMP,
  employee_nm           VARCHAR(40) NOT NULL,
  employee_surname      VARCHAR(40) NOT NULL,
  employee_patronymic   VARCHAR(40),
  email                 VARCHAR(50) NOT NULL,
  position_nm           VARCHAR(100) NOT NULL,
  CONSTRAINT PK_employee_version PRIMARY KEY (employee_id, valid_from_dttm)
);

CREATE TABLE IF NOT EXISTS clothes_shops.order (
  order_id           BIGSERIAL PRIMARY KEY,
  store_id           BIGINT REFERENCES clothes_shops.store(store_id),
  customer_id        BIGINT REFERENCES clothes_shops.customer(customer_id),
  delivery_point_id  BIGINT REFERENCES clothes_shops.delivery_point(delivery_point_id),
  delivery_dttm      TIMESTAMP,
  purchase_dttm      TIMESTAMP,
  buyout_flg         BOOLEAN
);



CREATE TABLE IF NOT EXISTS clothes_shops.clothes_x_order (
  order_id          BIGINT REFERENCES clothes_shops.order(order_id),
  clothes_id        BIGINT REFERENCES clothes_shops.clothes(clothes_id),
  item_count        INT CHECK ( item_count >= 0 ),
  CONSTRAINT PK_clothes_x_order PRIMARY KEY (order_id, clothes_id)
);


