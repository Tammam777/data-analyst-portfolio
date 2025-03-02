SELECT *
FROM layoffs_staging2 ;

SELECT MAX(total_laid_off) , MAX(percentage_laid_off)
FROM layoffs_staging2 ;

SELECT *
FROM layoffs_staging2 
WHERE percentage_laid_off = 1
ORDER BY  funds_raised_millions DESC ;


SELECT company ,SUM(total_laid_off)
FROM layoffs_staging2 
group by company
ORDER BY 2 DESC;

SELECT MIN(`date`) , MAX(`date`)
FROM layoffs_staging2 ;






SELECT country ,SUM(total_laid_off)
FROM layoffs_staging2 
group by country
ORDER BY 2 DESC;



SELECT *
FROM layoffs_staging2 ;


SELECT YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_staging2 
group by YEAR(`date`)
ORDER BY 1 DESC;





SELECT stage,SUM(total_laid_off)
FROM layoffs_staging2 
group by stage
ORDER BY 2 DESC;




SELECT company ,AVG(percentage_laid_off)
FROM layoffs_staging2 
group by company
ORDER BY 2 DESC;



SELECT substring(`date` , 1 , 7) AS `MONTH` ,SUM(total_laid_off)
FROM layoffs_staging2 
WHERE substring(`date` , 1 , 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1  ;

SELECT *
FROM layoffs_staging2 ;


WITH Rolling_Total AS
( SELECT substring(`date` , 1 , 7) AS `MONTH` ,SUM(total_laid_off) AS Total_off
FROM layoffs_staging2 
WHERE substring(`date` , 1 , 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1
)
SELECT `MONTH` ,Total_off 
,SUM(Total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total ;







SELECT company ,SUM(total_laid_off)
FROM layoffs_staging2 
group by company
ORDER BY 2 DESC;


SELECT company, YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_staging2 
GROUP BY company , YEAR(`date`) 
ORDER BY 3 DESC ;




WITH Company_year (Company , Years , Total_Laid_Off)AS
(SELECT company, YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_staging2 
GROUP BY company , YEAR(`date`)
), Company_Year_Rank AS
(SELECT * 
, DENSE_RANK() OVER(PARTITION BY Years ORDER BY Total_Laid_Off DESC) AS Ranking
FROM company_year 
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5 
 ;








