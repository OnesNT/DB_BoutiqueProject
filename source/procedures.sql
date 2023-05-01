/*
Increasesing database performance,it's bad when have the same complex query
do constantly.
Before executing a request,
1) What expressions are used in the query
2) Build a query execution plan, such as which indexes should be used
3) A query that is in a stored procedure is compiled only once */

DROP FUNCTION clothes_shops.analise_stores();

CREATE OR REPLACE FUNCTION clothes_shops.analise_stores()
RETURNS TABLE (
               store_nm               VARCHAR(60),
               head_office_country_nm VARCHAR(40),
               color_nm               VARCHAR(40),
               price_amt              BIGINT,
               brand_nm               VARCHAR(40)
              ) AS $$
  SELECT clothes_shops.store.store_nm,
         clothes_shops.store.head_office_country_nm,
         clothes_shops.clothes.color_nm,
         clothes_shops.clothes.price_amt,
         clothes_shops.brand.brand_nm
  FROM clothes_shops.store
  INNER JOIN clothes_x_store  on store.store_id = clothes_x_store.store_id
  INNER JOIN clothes on clothes_x_store.clothes_id = clothes.clothes_id
  INNER JOIN brand on clothes.brand_id = brand.brand_id
$$ LANGUAGE SQL;


/* A new item new_clothes has appeared in the shop in a quantity of count pieces */
SELECT * FROM clothes_shops.analise_stores();

-- TODO
-- CREATE OR REPLACE FUNCTION clothes_shops.insert_new_clothes(
--     shop VARCHAR(60), new_clothes_nm VARCHAR()
-- )
-- RETURNS TABLE ()



