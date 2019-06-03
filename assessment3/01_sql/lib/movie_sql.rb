require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie 'Rain Man'; order by the actors'
#    names.
def rain_man_cast
  MovieDatabase.execute(<<-SQL)
    SELECT
      actors.name
    FROM
      actors
    JOIN castings ON castings.actor_id = actors.id
    JOIN movies ON castings.movie_id = movies.id
    WHERE
      movies.title = 'Rain Man'
    ORDER BY
      actors.name 
SQL
end

# 2. List the films in which 'Matt Damon' has appeared; order by
# movie title.
def matt_damon_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title
    FROM
      movies
    JOIN actors ON castings.actor_id = actors.id
    JOIN castings ON castings.movie_id = movies.id
    WHERE
      actors.name = 'Matt Damon'
    ORDER BY
      movies.title 
SQL
end

# 3. List the films where 'Matt Damon' has appeared, but not in the
# star role. Order by movie title.
def matt_damon_supporting_actor_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title
    FROM
      movies
    JOIN actors ON castings.actor_id = actors.id
    JOIN castings ON castings.movie_id = movies.id
    WHERE
      actors.name = 'Matt Damon'
    AND
      castings.ord != 1 
    ORDER BY
      movies.title 
SQL
end

# 4. List the films together with the leading star for all films
#    produced between 1906 and 1908 (inclusive). Order by movie title,
#    and label the actors as 'star'.
def old_films_and_their_star
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title, actors.name AS star
    FROM
      movies
    JOIN actors ON castings.actor_id = actors.id
    JOIN castings ON castings.movie_id = movies.id
    WHERE
      movies.yr >= 1906
    AND
      movies.yr <= 1908
    AND
      castings.ord = 1 
    ORDER BY
      movies.title 
SQL
end

# 5. There is a film from 2012 in our database for which there is no
# associated casting information. Give the id and title of this movie.
def unknown_actors_2012
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.id, movies.title
    FROM
      movies
    LEFT JOIN castings ON castings.movie_id = movies.id
    WHERE
      castings.actor_id IS NULL
    AND
      movies.yr = 2012
SQL
end

# 6. Obtain a list in alphabetical order of actors who've had >=26
# starring roles. Order by actor name.
def biggest_stars
  MovieDatabase.execute(<<-SQL)
    SELECT
      actors.name, count(*) AS 'count'
    FROM
      actors
    JOIN castings ON castings.actor_id = actors.id
    WHERE
      castings.ord = 1
    GROUP BY
      actors.name
    HAVING
      count(*) >= 26
    ORDER BY
      actors.name
    
SQL
end

# 7. List the movie title and the leading actor for all of the films
#    in which 'Ben Affleck' appeared but not as the lead actor.
def stars_working_with_ben_affleck
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title, actors.name
    FROM
      movies
    JOIN actors ON castings.actor_id = actors.id
    JOIN castings ON castings.movie_id = movies.id
    WHERE
      castings.ord = 1
    AND 
      movies.title IN
      (SELECT
      movies.title
    FROM
      movies
    JOIN actors ON castings.actor_id = actors.id
    JOIN castings ON castings.movie_id = movies.id
    WHERE
        actors.name = 'Ben Affleck'
    AND
      castings.ord != 1)    
SQL
end

# 8. Which were the busiest years for 'John Travolta'? List the year
# and the number of movies he made each year, for any year in which he
# made >2 movies. Order by year.
def busiest_john_travolta_years
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.yr, count(*) AS 'count'
    FROM
      movies
    JOIN actors ON castings.actor_id = actors.id
    JOIN castings ON castings.movie_id = movies.id
    WHERE
      actors.name = 'John Travolta'
    GROUP BY
      movies.yr
    HAVING
      count(*) > 2    
SQL
end

