/*
Увеличивает производительность базы данных, плохо когда один и тот же сложный запрос
делают постоянно.
Перед выполнением запроса необходимо
1) Какие выражения используются в запросе
2) Построить план выполнения запроса, например какие индексы должны быть использованы
3) Запрос который находится в хранимой процедуре компилируется только один раз*/

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



SELECT * FROM clothes_shops.analise_stores();

/* В магазине shop появилась новая вещь new_clothes в количестве count штук  */
-- TODO
-- CREATE OR REPLACE FUNCTION clothes_shops.insert_new_clothes(
--     shop VARCHAR(60), new_clothes_nm VARCHAR()
-- )
-- RETURNS TABLE ()



