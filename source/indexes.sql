/* We don't use the indexes for tables that are
   1) The uniqueness of the values in a column affects the performance of the index.
   In general, the more duplicates you have in a column, the worse the index performs.
   
   2) Some fields should always be indexed: primary key, foreign key, unique fields

   3) It is worth indexing those fields that often participate in expressions like expr1 = expr2; groupby; order by(?)
   join expressions

   4) Do not do for those fields that are often subject to Update

   5) It is always worth looking at the application that uses the database in order to understand the structure of frequently asked questions
   */

CREATE INDEX ON clothes_shops.customer(customer_id);

CREATE INDEX ON clothes_shops.brand(brand_id);

CREATE INDEX ON clothes_shops.clothes(brand_id);

CREATE INDEX ON clothes_shops.clothes_x_store(store_id);
CREATE INDEX ON clothes_shops.clothes_x_store(clothes_id);

CREATE INDEX ON clothes_shops.store(store_id);

CREATE INDEX ON clothes_shops.delivery_point(delivery_point_id);
CREATE INDEX ON clothes_shops.delivery_point(store_id);

CREATE INDEX ON clothes_shops.employee_version(employee_id);
CREATE INDEX ON clothes_shops.employee_version(delivery_point_id);

CREATE INDEX ON clothes_shops.order(order_id);
CREATE INDEX ON clothes_shops.order(store_id);
