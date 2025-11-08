-- exploratory data analysis

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

select distinct *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc;

select distinct company, sum(distinct total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select min(`date`), max(`date`)
from layoffs_staging2;

select distinct industry, sum(distinct total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

select distinct country, sum(distinct total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

select year(`date`), sum(distinct total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

-- progression of layoffs
select substr(`date`, 1, 7) as `month`, sum(distinct total_laid_off)
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `month`
order by 1 asc;

with rolling_total as
(
select substr(`date`, 1, 7) as `month`, sum(distinct total_laid_off) as total_off
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `month`
order by 1 asc
)
select `month`, total_off,
sum(total_off) over(order by month) as rolling_total
from rolling_total;

select distinct company, year(`date`), sum(distinct total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;

with company_year as
(
  select company, year(`date`) as years, sum(distinct total_laid_off) as total_laid_off
  from layoffs_staging2
  group by company, year(`date`)
), 
company_year_rank as
(
  select *, 
    dense_rank() over (partition by years order by total_laid_off desc) as rank_of_layoffs
  from company_year
  where years is not null
)
select *
from company_year_rank
where rank_of_layoffs <= 5;
