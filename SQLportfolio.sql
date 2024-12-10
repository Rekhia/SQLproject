select *
from CovidDeaths2a
where continent is not null

--select *
--from [Covid-vacsanation2]


--select the data that we will use 
select location , date , total_cases , new_cases , total_deaths ,population
from CovidDeaths2a
order by 1,2

--looking at total_cases vs total_deaths
--showing likelihood dying if u contract covid in ur country 
select location , date , total_cases ,total_deaths , (total_deaths_per_million/total_cases_per_million)*100 as 'death percentage'
from CovidDeaths2a
where location like 'E%'
order by 1,2

-- looking at Total_cases vc Population 
--show what percentage of population got covid 
select location , date , population ,total_cases , total_cases_per_million, (total_cases_per_million/population)*100 as 'Population percentage'
from CovidDeaths2a
where location like 'E%'
order by 1,2


-- looking at countries with highest infection rate compared to Population
select location ,  population , max(total_cases )as highestinfection,  max((total_cases_per_million/population)) *100 as 'highest infection rate'
from CovidDeaths2a
group by location ,  population 
order by 'highest infection rate' desc


-- showing countries with highest deaths count per Population
select location ,  population , max(total_deaths ) as highestdeaths,  max((total_deaths_per_million/population)) *100 as 'highest deaths rate'
from CovidDeaths2a
group by location ,  population 
order by 'highest deaths rate' desc

--showing the continents with highest deathcount 
select continent,  max(total_deaths ) as highestdeaths
from CovidDeaths2a
where continent is not null
group by continent
order by highestdeaths


--Global Numbers 
Select date , sum(new_cases) as Totalcases,sum(new_deaths) as Totaldeths ,(sum(new_deaths_per_million) / sum(new_cases_per_million))
from CovidDeaths2a
where continent is not null 
group by date
ORDER BY 1,2


-- looking at total population 
SELECT date ,continent,location,population , total_deaths,
SUM(population) over(partition by location)
FROM Alex..CovidDeaths2a
where continent is not null

