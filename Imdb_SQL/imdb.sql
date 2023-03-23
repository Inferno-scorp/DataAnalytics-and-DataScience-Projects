Use imdb;
show tables;  

select * from information_Schema.columns where table_schema='imdb'; -- this will give us an overview of whats in our dataset and tables.

-- 1. Count the number of rows present in each table.
select
(select count(*) from directors) as directors_rows_count,
(select count(*) from directors_genres) as director_genres_rows_count,
(select count(*) from movies) as movies_rows_count,
(select count(*) from movies_directors) as movie_directors_rows_count,
(select count(*) from roles) as roles_rows_count;

-- 2. show the directors table.
select * from directors;

-- 3. Are there any Null Values in movies table ?

-- 0 for 'No' and 1 for 'Yes' as we have use aggregate function sum()
select sum(case 
when id is Null then 1 else 0 end ) as id, 
(case 
when name is Null then 1 else 0 end ) as name,
(case 
when year is Null then 1 else 0 end ) as year,
(case 
when rankscore is Null then 1 else 0 end ) as rankscore
from movies;


-- 4.  Show the movies released in each year.
select name as movie, year from movies group by year order by year;


-- 5. Count the number of movies released each year.
select year,count(name) from movies group by year order by year;

-- 6. Show the top 10 years with most movies released.
select year,count(name) as movies_count from movies group by year order by movies_count desc limit 10;


-- 7. What is the maximum, average, minimum rating(s) of all the movies;
select min(rankscore) from movies;
select avg(rankscore) from movies;
select max(rankscore) from movies;


-- 8. Show top ranked movies.
select movies.name, movies.rankscore from movies 
inner join (select name, max(rankscore) as maxrank from movies) movies2 on movies.rankscore=movies2.maxrank;


-- 9. Count the number of genres listed in the dataset and show what are those.

-- Genres
select distinct(genre) as count_of_genres from( 
select distinct(genre) from movies_genres
union
select distinct(genre) from directors_genres  ) as Genres ;

-- Count of Genres
select count(distinct(genre)) as count_of_genres from( 
select distinct(genre) from movies_genres
union
select distinct(genre) from directors_genres  ) as Genres ;


-- 10. Show the movies released by each director and store it in a temperory table.
create temporary table table1 (select md.director_id, md.movie_id , dr.director_name ,mv.movie_name from movies_directors as md inner join
(select id as director_id,concat(first_name," ",last_name) as director_name from directors) dr on md.director_id=dr.director_id
inner join (select id as movie_id, name as movie_name from movies) mv on md.movie_id = mv.movie_id);
select * from table1;

-- 11. Show the top 20 directors who have directed most number of movies.
select director_name , count(movie_name) as movies_count from table1 group by director_name order by movies_count desc limit 20 ;

-- 12. Show the list of generes with most number of movies.
select genre, count(movie_id) as movies_count from movies_genres group by genre order by movies_count desc;

-- 13. Show the directors who have directed diverse genra of movies, order by genre most to least.
with directors_with_most_genres as(
select director_id, count(genre) as genre_count from directors_genres group by director_id order by genre_count desc) 
select  concat(directors.first_name,directors.last_name) as director_name, directors.id as directors_id, directors_with_most_genres.genre_count  from directors 
inner join directors_with_most_genres on directors.id=directors_with_most_genres.director_id;

-- 14. Order movies from most to least number of roles played in the movies;
with rolescount as 
(select movie_id,count(role) as number_of_roles from roles group by movie_id )
select  movies.name, rolescount.number_of_roles from movies inner join rolescount on movies.id=rolescount.movie_id order by number_of_roles desc;

-- 15. Show the movies whose name start with 'An' and having rankscore>9.
select * from movies where name like 'An%' having rankscore>9;

-- 16. Show the movies having name start with 'Fig' end with 'ub' , having charecter length 10 and released in 1999.
select * from movies where name like 'Fig%ub'and length(name)=10 and year=1999; 
-- Note: Space(" ") is  also is a charecter.

-- 17. Show the movies from 1800 to 2000 having rankscore greater than 9.5;
select * from movies having year between 1800 and 2000 and rankscore>9.5 order by year;

-- 18. Show the rankscores of the movies table having names ('Top Gun','Blade Runner','Border') and years they were released in.
select lower(name),rankscore,year from movies where name in ('top gun','blade runner','border');


