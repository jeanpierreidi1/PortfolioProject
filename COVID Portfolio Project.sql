
Select *
From CovidDeaths
Where continent is not null
Order by 3,4


--Select *
--From CovidVaccinations
--Order by 3,4

--Select the Data that we will be using

Select Location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths
Where continent is not null
Order by 1,2

--Looking at Total Cases vs Total Deaths, I choose Africa because it's my home continent
-- Shows likelihood of dying if you contract covid in your country, I choose Africa because it's my home continent

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From CovidDeaths
Where location like '%Africa%'
Where continent is not null
Order by 1,2

--Looking at Total Cases vs Population
-- Shows what percentage of population got Covid

Select Location, date, population, total_cases,(total_cases/population)*100 as PercentPopulationInfected 
From CovidDeaths
Where continent is not null
--Where location like '%Africa%'
Order by 1,2

-- Looking for Countries with Highest Infection Rate compared to population

Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX(total_cases/population)*100 as PercentPopulationInfected 
From CovidDeaths
Where continent is not null
--Where location like '%Congo%'
Group by Location, population
Order by PercentPopulationInfected desc

-- Looking for Countries with Lowest Infection Rate compared to population

Select Location, population, MIN(total_cases) as LowestInfectionCount, MIN(total_cases/population)*100 as PercentPopulationInfected 
From CovidDeaths
Where continent is not null
--Where location like '%Congo%'
Group by Location, population
Order by PercentPopulationInfected desc

-- Showing Countries with Highest Death Count per Population

Select Location, MAX(cast(Total_Deaths as int)) as TotalDeathsCount 
From CovidDeaths
Where continent is not null
--Where location like '%Congo%'
Group by Location
Order by TotalDeathsCount desc

-- LET'S BREAK THINGS DOWN BY CONTINENT

Select continent, MAX(cast(Total_Deaths as int)) as TotalDeathsCount 
From CovidDeaths
Where continent is not null
--Where location like '%Congo%'
Group by continent
Order by TotalDeathsCount desc

Select location, MAX(cast(Total_Deaths as int)) as TotalDeathsCount 
From CovidDeaths
Where continent is null
--Where location like '%Congo%'
Group by location
Order by TotalDeathsCount desc

-- GLOBAL NUMBERS

Select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as totalDeaths, SUM(cast(new_deaths as int))/SUM(New_cases)*100 as DeathPercentage
From CovidDeaths
Where continent is not null
--Where location like '%Congo%'
Group By date
Order by 1,2

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as totalDeaths, SUM(cast(new_deaths as int))/SUM(New_cases)*100 as DeathPercentage
From CovidDeaths
Where continent is not null
--Where location like '%Congo%'
-- Group By date
Order by 1,2

-- Looking at Total Population vs Vaccination

Select *
From CovidDeaths  dea 
Join CovidVaccinations vac
 On dea.location = vac.location
 and dea.date = vac.date

Select dea.continent, dea.location, dea.date, dea.population
From CovidDeaths  dea 
Join CovidVaccinations vac
 On dea.location = vac.location
 and dea.date = vac.date
Where dea.continent is not null
order by 2,3

-- CREATION of Views 

create View  TotalDeathsCount as
Select location, MAX(cast(Total_Deaths as int)) as TotalDeathsCount 
From CovidDeaths
Where continent is not null
--Where location like '%Congo%'
Group by location
--Order by TotalDeathsCount desc


create View  HighestInfectionCount as
Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX(total_cases/population)*100 as PercentPopulationInfected 
From CovidDeaths
Where continent is not null
--Where location like '%Congo%'
Group by Location, population
--Order by PercentPopulationInfected desc

-- Looking for Countries with Lowest Infection Rate compared to population

create View  LowestInfectionCount as
Select Location, population, MIN(total_cases) as LowestInfectionCount, MIN(total_cases/population)*100 as PercentPopulationInfected 
From CovidDeaths
Where continent is not null
--Where location like '%Congo%'
Group by Location, population
--Order by PercentPopulationInfected desc

Select *
From CovidDeaths
