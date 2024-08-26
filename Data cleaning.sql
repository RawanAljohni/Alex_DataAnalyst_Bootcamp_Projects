-- Data Cleaning

Select * 
From layoffs;

Create table layoffs_staging
Like Layoffs;

Select * 
From layoffs_staging
;

Insert layoffs_staging
Select * From layoffs;


-- Now when we are data cleaning we usually follow a few steps
-- 1. Remove duplicates
-- 2. standardize The data 
-- 3. Null values  or Blank values
-- 4. remove any columns and rows that are not necessary 


-- 1. Remove Duplicates

Select * ,
Row_number() Over (partition by
company,location,industry,total_laid_off,percentage_laid_off,'data',
country,funds_raised_millions) As row_num
From layoffs_staging;


With duplicate_cte As
(
Select * ,
Row_number() Over( partition by
company,location,industry,total_laid_off,percentage_laid_off,stage,'data',
country,funds_raised_millions) As row_num
From layoffs_staging
)
Select * 
From duplicate_cte
Where row_num > 1;


Select * 
From layoffs_staging
Where company = "casper";


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` Int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


Select * 
From layoffs_staging2;

Insert Into layoffs_staging2 
Select * ,
Row_number() Over(
 partition by company,location,industry,total_laid_off,percentage_laid_off,stage,'data',
country,funds_raised_millions) As row_num
From layoffs_staging;
 
 -- temporary disable for the sql safe update mode
set sql_safe_updates =0;

--  now that we have this we can delete rows were row_num is greater than 2

Select * 
From layoffs_staging2
where row_num = 1;

Delete 
From layoffs_staging2
where row_num >1;

-- standarizing data 

-- Trim() to remove leading (spaces at begining) and trailing
Select company, Trim(company)
from layoffs_staging2;

Update layoffs_staging2
set company = Trim(company);

Select *
from layoffs_staging2
;

Select DISTINCT industry
from layoffs_staging2
order by 1
;

update layoffs_staging2
set industry = 'Crypto'
WHERE industry like 'crypto%';

Select DISTINCT country 
from layoffs_staging2
order by 1;

Select *
from layoffs_staging2
WHERE country like 'United States%'
order by 1;

-- Delete (full stops) from United States statments to remove duplicates
Select DISTINCT country, Trim(Trailing '.' from country)
From layoffs_staging2
Order By 1;

Update layoffs_staging2
set country = Trim(Trailing '.' from country)
WHERE country like 'United States%';

-- change date column type from string to date
Select `date`,
str_to_date(`date`, '%m/%d/%Y')
From layoffs_staging2;

Update layoffs_staging2
set  `date` = str_to_date(`date`, '%m/%d/%Y')
;

Alter Table layoffs_staging2
MODIFY COLUMN `date` DATE;

-- 3.Null Values

Select *
From layoffs_staging2;


Select * 
From layoffs_staging2
where row_num = 1
order by company DESC;

-- Check miss values or null values 

Select *
From layoffs_staging2
Where industry is null
or industry = ''
;

-- Check if we have any addional inf in other row
Select *
From layoffs_staging2
Where company ='Airbnb';

Select *
From layoffs_staging2
Where company ='Juul';

-- delete ' ' row by change it to null values 
Update layoffs_staging2
Set  industry = null
where industry ='';


Select *
From layoffs_staging2 t1
Join layoffs_staging2 t2
      on t1.company = t2.company
Where t1. industry Is Null 
And t2.industry Is Not Null;

Update layoffs_staging2 t1 
Join layoffs_staging2 t2
     on t1.company = t2.company
Set t1.industry = t2.industry   
Where t1. industry Is Null 
And t2.industry Is Not Null; 

-- 
Select * 
From layoffs_staging2
where total_laid_off IS NULL
And percentage_laid_off IS NULL
;

Delete
From layoffs_staging2
where total_laid_off IS NULL
And percentage_laid_off IS NULL
;

Alter Table layoffs_staging2
Drop Column row_num;

Select * 
From layoffs_staging2;


 







