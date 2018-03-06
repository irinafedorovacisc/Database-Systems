/* 
    Passengers on the Titanic:
        1,503 people died on the Titanic.
        - around 900 were passnegers, 
        - the rest were crew members.

    This is a list of what we know about the passengers.
    Some lists show 1,317 passengers, 
        some show 1,313 - so these numbers are not exact, 
        but they will be close enough that we can spot trends and correlations.

    Lets' answer some questions about the passengers' survival data: 
 */

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/* Create a database (if we don't already have one). */

-- CREATE DATABASE classwork;  -- (or whatever else you want to name it).

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*  Create the table and get data into it: */


/*
DROP TABLE PASSENGERS;  -- for adjustments / etc - can drop and re-create.

CREATE TABLE passengers (
    id INTEGER NOT NULL,
    lname TEXT,
    title TEXT,
    class TEXT, 
    age FLOAT,
    sex TEXT,
    survived INTEGER,
    code INTEGER
);

-- NOTE:  On an exam, this would look like:
-- passengers(id, lname, title, class, age, sex, survived, code)

-- Now get the data into the database:
\COPY passengers FROM './titanic.csv' WITH (FORMAT csv);


*/
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-- How many total:
select count(*) as total_passengers from passengers;

-- How many survived?
select count(*) as survived from passengers where survived=1;

-- How many died?
select count(*) as did_not_survive from passengers where survived=0;

-- How many were female? Male?
select count(*) as total_females from passengers where sex='female';
select count(*) as total_males from passengers where sex='male';

-- How many total females died?  Males?
select count(*) as no_survived_females from passengers where sex='female' and survived=0;
select count(*) as no_survived_males from passengers where sex='male' and survived=0;


-- Percentage of females of the total?
select 
    sum(case when sex='female' then 1.0 else 0.0 end) / 
        cast(count(*) as float)*100 as tot_pct_female 
    from passengers;

-- Percentage of males of the total?
select 
    sum(case when sex='male' then 1.0 else 0.0 end) / 
        cast(count(*) as float)*100 as tot_pct_male 
    from passengers;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%% Finish the rest by answering these questions  %%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%% Most are SQL - some are conceptual            %%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%%   short answers are fine for conceptual.      %%%%%%%%%%%%%%%%%%%
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-- 1.  What percent survived? (total)

-- 2.  Percentage of females that survived?

-- 3.  Percentage of males that survived?

-- 4.  How many people total were in First class, Second class, Third, or unknown ?

-- 5.  What is the total number of people in First and Second class ?

-- 6.  What are the survival percentages of the different classes? (3).




-- 7.  Can you think of other interesting questions about this dataset?
--      I.e., is there anything interesting we can learn from it?  
--      Try to come up with at least two new questions we could ask.

--      Example:
--      Can we calcualte the odds of survival if you are a female in Second Class?
--      Could we compare this to the odds of survival if you are a Female in First Class?
--      If we can answer this question, is it meaningful?  Or just a coincidence ... ?



-- 8.  How would we answer those questions if we did think of some?
--      Are you able to write the query to find the answer now?  
--      Or - do we need more data to find out - is this data set sufficient?

--      Do you posess the SQL knowledge now to answer these questions using the dataset?
--          If not, what else might we need to learn in order to do it?


--      If you did answer some questions about the data, 
--          how would you justify or defend your results if someone challenged them?
--          -- Did the query make sense?  Are your methods good ?


/*
    Email me just this document - just fill in your answers.
    Your sql should run without errors - please test it beforehand.

    email:  gordon@sci.brooklyn.cuny.edu
    Due Date: Feb 8, 2018 - one week. 
*/
