use videogames;

select * from vgsales;

select avg(NA_Sales) from vgsales;

SELECT 
    AVG(NA_Sales) AS avg_NA,
    AVG(JP_Sales) AS avg_JP,
    AVG(Global_Sales) AS avg_Global 
    from vgsales;
    
# group the games section by genres
SELECT 
    genre,
    COUNT(*) AS genre_count
FROM 
    vgsales
GROUP BY 
    genre;
    
# find sales % of each genre for america
SELECT 
    genre,
    SUM(NA_Sales) AS americasales,
    (SUM(NA_Sales) * 100 / (SELECT SUM(NA_Sales) FROM vgsales)) AS america_sales_percentage
FROM 
    vgsales
GROUP BY 
    genre;
   
# find sales % of each genre for global data
SELECT 
    genre,
    SUM(Global_Sales) AS globalsales,
    (SUM(Global_Sales) * 100 / (SELECT SUM(Global_Sales) FROM vgsales)) AS global_sales_percentage
FROM 
    vgsales
GROUP BY 
    genre;
    
# group the games section by publishers
SELECT 
    Publisher,
    COUNT(*) AS Publisher_count
FROM 
    vgsales
GROUP BY 
    Publisher;

# sales report by publishers in america and global
SELECT 
    publisher,
    SUM(CASE WHEN NA_sales = 'america' THEN global_sales ELSE 0 END) AS sales_in_america,
    SUM(global_sales) AS global
FROM 
    vgsales
GROUP BY 
    publisher;

