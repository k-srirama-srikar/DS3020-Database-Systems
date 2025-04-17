-- Create the schema for the actor and movie tables
DO $$
BEGIN
    -- Create the movie table
    CREATE TABLE IF NOT EXISTS public.movie (
        movieid INTEGER NOT NULL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        genre VARCHAR(50) NOT NULL,
        releaseyear INTEGER NOT NULL,
        rating INTEGER DEFAULT 5
    );

    -- Create the actor table
    CREATE TABLE IF NOT EXISTS public.actor (
        actorid INTEGER NOT NULL PRIMARY KEY,
        movieid INTEGER,
        name VARCHAR(100) NOT NULL,
        age INTEGER NOT NULL,
        CONSTRAINT actor_movieid_fkey FOREIGN KEY (movieid) REFERENCES public.movie (movieid)
    );
END;
$$ LANGUAGE plpgsql;

-- Insert data into the movie table
DO $$
BEGIN
    INSERT INTO public.movie (movieid, name, genre, releaseyear, rating) VALUES
        (4, 'Inception', 'Sci-Fi', 2010, 5),
        (5, 'The Shawshank Redemption', 'Drama', 1994, 5),
        (1, 'Forrest Grump', 'Drama', 1994, 4),
        (3, 'The Godfather', 'Crime', 1972, 4),
        (2, 'The Matrix', 'Sci-Fi', 1999, 3)
    ON CONFLICT (movieid) DO NOTHING;
END;
$$ LANGUAGE plpgsql;

-- Insert data into the actor table
DO $$
BEGIN
    INSERT INTO public.actor (actorid, movieid, name, age) VALUES
        (3, 1, 'Tom Hanks', 64),
        (4, 3, 'Marlon Brando', 80),
        (5, 4, 'Leonardo DiCaprio', 46),
        (6, 5, 'Morgan Freeman', 87),
        (8, 3, 'Al Pacino', 84),
        (9, 4, 'Joseph Gordon-Levitt', 43),
        (10, 5, 'Tim Robbins', 66),
        (11, 3, 'Diane Keaton', 79),
        (13, 5, 'Bob Gunton', 77),
        (14, 1, 'Robin Wright', 58),
        (2, 2, 'Keanu Reeves', 60),
        (7, 2, 'Carrie-Anne Moss', 59),
        (12, 2, 'Laurence Fishburne', 64)
    ON CONFLICT (actorid) DO NOTHING;
END;
$$ LANGUAGE plpgsql;