-- Exploratory Data Analysis
select * 
From layoffs_staging2;

Select Max(total_laid_off),Max(percentage_laid_off)
From layoffs_staging2
;

select * 
From layoffs_staging2
Where percentage_laid_off = 1
order by total_laid_off Desc ;

select * 
From layoffs_staging2
Where percentage_laid_off = 1
order by funds_raised_millions Desc ;

select Year(`date`), Sum(total_laid_off)
From layoffs_staging2
Group by Year(`date`)
order by 1 DESC; 

Select country , Sum(total_laid_off)
From layoffs_staging2
GROUP BY country
Order by 2 DESC;

Select industry , Sum(total_laid_off)
From layoffs_staging2
GROUP BY industry
Order by 2 DESC;

-- Which companies had 1 which is basically 100 percent of they company laid off
Select company , Sum(total_laid_off)
From layoffs_staging2
GROUP BY company
Order by 2 DESC;

Select Min(`date`), Max(`date`)
From layoffs_staging2;

show  Variables like 'version_comment';

Select Substring(`date` ,1, 7) As `Month`, Sum(total_laid_off) As TotalLaidOff
From layoffs_staging2
Where Substring(`date` ,1, 7) Is Not Null
Group By `Month`
order By `Month` ASC
;

With Rolling_Total As
(
Select Substring(`date` ,1, 7) As `Month`, Sum(total_laid_off) As TotalLaidOff
From layoffs_staging2
Where Substring(`date` ,1, 7) Is Not Null
Group By `Month`
order By `Month` ASC
)
Select `Month`,TotalLaidOff,Sum(TotalLaidOff) Over(order By `Month`) As Rolling_LaidOff
From Rolling_Total;

Select company ,year(`Date`) years, Sum(total_laid_off) As TotalLaidOff
From layoffs_staging2
GROUP BY company , years
Order by TotalLaidOff DESC ;

With Company_Year (company,Years,TotalLaidOff) As
(
Select company ,year(`Date`), Sum(total_laid_off) 
From layoffs_staging2
GROUP BY company , year(`Date`)
), Company_year_Rank As 
(
Select * , 
DENSE_RANK() Over(Partition By years Order By TotalLaidOff DESC) As Ranking
From Company_Year
where years Is Not Null
)
Select*
From Company_year_Rank
Where Ranking<=10;



