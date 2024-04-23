USE wg;
SELECT *
FROM mg_cleanedsl;
SELECT *
FROM vgs_cleanedsl;
SELECT *
FROM vgs_mg_cleanedsl;

SELECT year,
ROUND(AVG(na_sales),2) AS average_sales_na,
ROUND(AVG(jp_sales),2) AS average_sales_jp,
ROUND(sum(na_sales)/SUM(global_sales), 2) as share_sales_na_in_global,
ROUND(sum(jp_sales)/SUM(global_sales), 2) as share_sales_jp_in_global
FROM vgs_cleanedsl
GROUP BY year
ORDER BY year DESC
LIMIT 27;

SELECT year,
ROUND(SUM(na_sales),2) AS sales_na_on_moovie,
ROUND(SUM(jp_sales),2) AS sales_jp_on_moovie,
ROUND(SUM(global_sales),2) AS sales_global_on_moovie,
ROUND(sum(na_sales)/SUM(global_sales), 4) as share_sales_na_on_moovie_in_global,
ROUND(sum(jp_sales)/SUM(global_sales), 4) as share_sales_jp_on_moovie_in_global
FROM vgs_mg_cleanedsl
GROUP BY year
ORDER BY year DESC
LIMIT 27;

SELECT year,
ROUND(AVG(na_sales),2) AS average_sales_na,
ROUND(AVG(jp_sales),2) AS average_sales_jp,
ROUND(sum(na_sales)/SUM(global_sales), 2) as share_sales_na_in_global,
ROUND(sum(jp_sales)/SUM(global_sales), 2) as share_sales_jp_in_global,
ROUND(AVG(na_sales),2) AS average_sales_na_on_moovie,
ROUND(AVG(jp_sales),2) AS average_sales_jp_on_moovie,
ROUND(sum(na_sales)/SUM(global_sales), 2) as share_sales_na_on_moovie_in_global,
ROUND(sum(jp_sales)/SUM(global_sales), 2) as share_sales_jp_on_moovie_in_global
FROM vgs_mg_cleanedsl
INNER JOIN vgs_mg_cleanedsl AS vmc USING(year, name, publisher)
GROUP BY year
ORDER BY year DESC;