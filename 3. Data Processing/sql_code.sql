select * from `data`.`case_study2`.`viewership`;

--Joining the two tables
select UserID0,
      Channel2,
      RecordDate2,
      `Duration 2`,
      Name,
      Surname,
      Email, 
      Gender,
      Race,
      Age,
      Province,
      `Social Media Handle`
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
ON A.UserID0 = B.UserID;

-----------------------------------------------------------
                    --- SELECT DISTINCT---
-----------------------------------------------------------

-- Want to check different channels from BrightTv
select DISTINCT Channel2
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
ON A.UserID0 = B.UserID;

--Want to check different races that watch channels from BrightTv
select DISTINCT Race
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
ON A.UserID0 = B.UserID;

--Want to check different provinces that watch channels from BrightTv
select DISTINCT Province
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
ON A.UserID0 = B.UserID;

--Want to check different channels from BrightTv and their respective viewership duration

select Channel2,
      SUM(DATEDIFF(RecordDate2,`Duration 2`)) AS Total_Duration
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
ON A.UserID0 = B.UserID
GROUP BY Channel2
ORDER BY Total_Duration DESC; 
---------------------------------------------------------------------------------------------

-------------------------------------------------
          --- Min and Max of duration---
-------------------------------------------------
SELECT MIN(`Duration 2`) AS Min_Duration,
       MAX(`Duration 2`) AS Max_Duration
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID;

---------------------------------------------------------
                 ---MIN and MAX of Age---
---------------------------------------------------------
select MIN(Age)
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID;

select MAX(Age)
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID;

-----------------------------------------------------------------------------------------

--------------------------------------------------------
--- Want to check the number of viewership per day---
--------------------------------------------------------
SELECT DISTINCT DAYNAME(RecordDate2) AS Day,
        COUNT(*) AS Total_Views  
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID
GROUP BY DAYNAME (RecordDate2)
ORDER BY Total_Views ASC;

-------------------------------------------------------------
---Want to check the total duration of viewership per day---
-------------------------------------------------------------
select DAYNAME (RecordDate2) AS Day,
       SUM(`Duration 2`) AS Total_Duration
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID
GROUP BY DAYNAME (RecordDate2)
ORDER BY Total_Duration DESC;

---------------------------------------------------------------
--- Want to check the total viewership per day and province---
---------------------------------------------------------------
select DAYNAME (RecordDate2) AS Day_name,
                Province,
      COUNT(*) AS Total_views
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID
GROUP BY DAYNAME (RecordDate2), Province
ORDER BY Total_views DESC;

-------------------------------------------------------------------
--- Want to check the total viewership per day and gender---
------------------------------------------------------------------
select DAYNAME (RecordDate2) AS Day_name,
               Gender,
      COUNT(*) AS Total_views
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID
GROUP BY DAYNAME (RecordDate2), Gender
ORDER BY Total_views DESC;

----------------------------------------------------------------------
--- Want to check the total viewership per day and race---
----------------------------------------------------------------------
select DAYNAME (RecordDate2) AS Day_name,
               Race,
      COUNT(*) AS Total_views
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID
GROUP BY DAYNAME (RecordDate2), Race
ORDER BY Total_views DESC;

---------------------------------------------------------------
--- Want to check the total viewership per gender vs channel---
---------------------------------------------------------------
select Channel2,
       Gender,
    COUNT(*) AS Total_views
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID
GROUP BY Channel2,Gender
ORDER BY Total_views DESC;

--------------------------------------------------------------
--- Want to check the total viewership per race vs channel---
--------------------------------------------------------------
select Channel2,
       Race,
    COUNT(*) AS Total_views
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles`
     ON A.UserID0 = B.UserID
GROUP BY Channel2
ORDER BY Total_views ASC;

----------------------------------------------------
--- Want to check the total viewership per age---
----------------------------------------------------
select Age,
COUNT(*) AS Total_views
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID
GROUP BY Age
ORDER BY Total_views DESC;

-----------------------------------------------------------------------------------
                        ---   Extracting the year----
-----------------------------------------------------------------------------------
select YEAR(RecordDate2) AS Year,
      COUNT(*) AS Total_views
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID
GROUP BY YEAR(RecordDate2)
ORDER BY Total_views DESC;

---------------------------------------------------------
                ---Extracting the months---
---------------------------------------------------------
select MONTHNAME(RecordDate2) AS Month,
      COUNT(*) AS Total_views
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID
GROUP BY MONTHNAME(RecordDate2)
ORDER BY Total_views DESC;

-----------------------------------------------------------------------
--- Converting UTC to SA time---
-----------------------------------------------------------------------
SELECT 
    RecordDate2,
    from_utc_timestamp(RecordDate2, 'Africa/Johannesburg') AS SA_Time
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID;

------------------------------------------------------------------------------
--- NUUL Function ---
------------------------------------------------------------------------------
select *, 
      IFNULL (Province, 'Unknown') AS Province,
      IFNULL (Gender, 'Unknown') AS Gender,
      IFNULL (Race, 'Unknown') AS Race
from `data`.`case_study2`.`viewership` AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
      ON A.UserID0 = B.UserID;      


-- ============================================================
-- BrightTV Enhanced Viewership Dataset
-- Combines viewership + user profiles with all derived fields
-- ============================================================

SELECT

    -- ── Identifiers
    UserID0 AS UserID,

    -- ── Time dimensions
    RecordDate2 AS UTC_Timestamp,
    FROM_UTC_TIMESTAMP(RecordDate2, 'Africa/Johannesburg') AS SA_Timestamp,
    YEAR(RecordDate2) AS View_Year,
    MONTHNAME(RecordDate2) AS View_Month,
    MONTH(RecordDate2) AS View_Month_Num,
    DAYNAME(RecordDate2) AS View_Day,
    DAYOFWEEK(RecordDate2) AS View_Day_Num,

    -- ── Channel
    Channel2 AS Channel,

    -- ── Duration
    `Duration 2` AS Duration_Start,
    DATEDIFF(RecordDate2, `Duration 2`) AS Duration_Minutes,

    -- ── Viewer demographics
    Age AS Age,
    CASE
        WHEN Age BETWEEN 0  AND 17 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN Age >= 55             THEN '55+'
        ELSE 'Unknown'
    END AS Age_Group,

    Gender AS Gender,
    Race AS Race,
    Province AS Province,

CASE
        WHEN DAYOFWEEK(RecordDate2) IN (1, 7) THEN 'Weekend'
        ELSE  'Weekday'
    END AS Day_classification


FROM      `data`.`case_study2`.`viewership`    AS A
LEFT JOIN `data`.`case_study2`.`user_profiles` AS B
       ON A.UserID0 = B.UserID

ORDER BY
    RecordDate2 DESC,
    Channel2    ASC;






