-- JOINS
-- 1. STUDENTS TABLE
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(20) NOT NULL,
    student_class VARCHAR(10) NOT NULL,
    student_group VARCHAR(10) CHECK(student_group IN ('Science', 'Commerce', 'Arts'))
);

-- 2. ACADEMICS TABLE
CREATE TABLE students_academics (
    academic_id INT AUTO_INCREMENT PRIMARY KEY,
    academic_student_id INT NOT NULL,
    academics_english DECIMAL(5,2) NOT NULL,
    academics_science DECIMAL(5,2) NOT NULL,
    academics_social DECIMAL(5,2) NOT NULL,
    academics_math DECIMAL(5,2) NOT NULL,
    academics_biology DECIMAL(5,2) DEFAULT NULL,
    academics_computer DECIMAL(5,2) DEFAULT NULL,
    -- Grade calculated automatically using CASE!
    academics_grade VARCHAR(1) GENERATED ALWAYS AS (
        CASE
            WHEN (academics_english + academics_science + academics_social + academics_math +
                  COALESCE(academics_biology, academics_computer, 0)) / 5 >= 90 THEN 'A'
            WHEN (academics_english + academics_science + academics_social + academics_math +
                  COALESCE(academics_biology, academics_computer, 0)) / 5 >= 80 THEN 'B'
            WHEN (academics_english + academics_science + academics_social + academics_math +
                  COALESCE(academics_biology, academics_computer, 0)) / 5 >= 70 THEN 'C'
            WHEN (academics_english + academics_science + academics_social + academics_math +
                  COALESCE(academics_biology, academics_computer, 0)) / 5 >= 60 THEN 'D'
            ELSE 'F'
        END
    ) STORED,
    CONSTRAINT chk_bio_or_comp CHECK(
        (academics_biology IS NOT NULL AND academics_computer IS NULL) OR
        (academics_biology IS NULL AND academics_computer IS NOT NULL)
    ),
    FOREIGN KEY (academic_student_id) REFERENCES students(student_id)
);

-- 3. EXTRACURRICULARS TABLE
CREATE TABLE student_extracurriculars (
    extra_id INT AUTO_INCREMENT PRIMARY KEY,
    extra_student_id INT NOT NULL,
    extra_theatre BOOLEAN DEFAULT FALSE,
    extra_music BOOLEAN DEFAULT FALSE,
    extra_sports BOOLEAN DEFAULT FALSE,
    -- All rounder calculated automatically!
    extra_allRounder BOOLEAN GENERATED ALWAYS AS (
        extra_theatre AND extra_music AND extra_sports
    ) STORED,
    FOREIGN KEY (extra_student_id) REFERENCES students(student_id)
);

-- ********************** INSERT VALUES INTO TABLE

-- STUDENTS
INSERT INTO students (student_name, student_class, student_group)
VALUES
('Vysna',   '12A', 'Science'),
('Devi',    '12A', 'Science'),
('Shibu',   '12B', 'Commerce'),
('Meena',   '11A', 'Science'),
('Padma',   '11B', 'Arts'),
('Arjun',   '12A', 'Science'),
('Priya',   '11A', 'Commerce'),
('Karthik', '12B', 'Science'),
('Sneha',   '11B', 'Arts'),
('Rahul',   '12A', 'Commerce'),
('Ananya',  '11A', 'Science'),
('Vikram',  '12B', 'Arts');

-- ACADEMICS (biology OR computer, not both!)
INSERT INTO students_academics 
(academic_student_id, academics_english, academics_science, academics_social, academics_math, academics_biology, academics_computer)
VALUES
(1,  95.0, 92.0, 88.0, 97.0, 94.0, NULL),   -- Vysna   - Biology  - A
(2,  85.0, 88.0, 82.0, 90.0, 86.0, NULL),   -- Devi    - Biology  - B
(3,  75.0, 70.0, 78.0, 72.0, NULL, 74.0),   -- Shibu   - Computer - C
(4,  92.0, 95.0, 90.0, 98.0, 93.0, NULL),   -- Meena   - Biology  - A
(5,  65.0, 62.0, 68.0, 60.0, NULL, 64.0),   -- Padma   - Computer - D
(6,  88.0, 91.0, 85.0, 93.0, 89.0, NULL),   -- Arjun   - Biology  - B
(7,  78.0, 75.0, 80.0, 76.0, NULL, 77.0),   -- Priya   - Computer - C
(8,  55.0, 52.0, 58.0, 50.0, NULL, 54.0),   -- Karthik - Computer - F
(9,  82.0, 80.0, 84.0, 78.0, NULL, 81.0),   -- Sneha   - Computer - B
(10, 70.0, 68.0, 72.0, 65.0, NULL, 69.0),   -- Rahul   - Computer - C
(11, 91.0, 94.0, 89.0, 96.0, 92.0, NULL),   -- Ananya  - Biology  - A
(12, 60.0, 58.0, 62.0, 55.0, NULL, 59.0);   -- Vikram  - Computer - D

-- EXTRACURRICULARS
INSERT INTO student_extracurriculars 
(extra_student_id, extra_theatre, extra_music, extra_sports)
VALUES
(1,  TRUE,  TRUE,  TRUE),   -- Vysna   - ALL ROUNDER! 👑
(2,  TRUE,  FALSE, TRUE),   -- Devi
(3,  FALSE, TRUE,  TRUE),   -- Shibu
(4,  TRUE,  TRUE,  TRUE),   -- Meena   - ALL ROUNDER!
(5,  FALSE, FALSE, TRUE),   -- Padma
(6,  TRUE,  FALSE, FALSE),  -- Arjun
(7,  FALSE, TRUE,  FALSE),  -- Priya
(8,  TRUE,  TRUE,  TRUE),   -- Karthik - ALL ROUNDER!
(9,  FALSE, FALSE, FALSE),  -- Sneha   - none
(10, TRUE,  FALSE, TRUE),   -- Rahul
(11, TRUE,  TRUE,  FALSE),  -- Ananya
-- Vikram NOT inserted intentionally for LEFT/RIGHT JOIN demo!
(12, FALSE, FALSE, FALSE);  -- Vikram

-- ****************************** DATA UPDATES TO THE TABLE QUERIES

/**

students          academics         extracurriculars
────────          ─────────         ────────────────
1  Vysna    ✅        ✅                    ✅
2  Devi     ✅        ✅                    ✅
3  Shibu    ✅        ✅                    ✅
4  Meena    ✅        ✅                    ✅
5  Padma    ✅        ✅                    ✅
6  Arjun    ✅        ✅                    ✅
7  Priya    ✅        ✅                    ✅
8  Karthik  ✅        ✅                    ✅
9  Sneha    ✅        ✅                    ✅
10 Rahul    ✅        ✅                    ✅
11 Ananya   ✅        ✅              ❌ NO EXTRA
12 Vikram   ✅        ❌ NO ACADEMICS       ✅
13 NewKid   ✅        ❌ NO ACADEMICS ❌ NO EXTRA

**/

-- Step 1: Add a new student with NO academics and NO extracurriculars
INSERT INTO students (student_name, student_class, student_group)
VALUES ('NewKid', '10A', 'Arts');

-- Step 2: Delete Vikram's academics (keep student)
DELETE FROM students_academics
WHERE academic_student_id = 12;

-- Step 3: Delete Ananya's extracurriculars (keep student)
DELETE FROM student_extracurriculars
WHERE extra_student_id = 11;

-- Step 4: Add orphan academics record (no matching student)
-- First disable foreign key check temporarily
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO students_academics
(academic_student_id, academics_english, academics_science,
academics_social, academics_math, academics_computer)
VALUES (99, 88.0, 85.0, 82.0, 90.0, 87.0);

SET FOREIGN_KEY_CHECKS = 1;


/**-----------------------------------------------------
   ******************** INNER JOIN ********************
------------------------------------------------------**/
-- Only students WITH academics
SELECT 
    s.student_id,
    s.student_name,
    s.student_class,
    a.academics_grade
FROM students s
INNER JOIN students_academics a
ON s.student_id = a.academic_student_id
ORDER BY s.student_id;


/**
Expected result:
1  Vysna   12A  A
2  Devi    12A  B
...
11 Ananya  11A  A
← Vikram MISSING (no academics)
← NewKid MISSING (no academics)
← student_id 99 MISSING (no student)
Total: 11 rows
**/

/**-----------------------------------------------------
   ******************** LEFT JOIN ********************
------------------------------------------------------**/

-- ALL students + academics if exists
SELECT
    s.student_id,
    s.student_name,
    s.student_class,
    a.academics_grade
FROM students s
LEFT JOIN students_academics a
ON s.student_id = a.academic_student_id
ORDER BY s.student_id;

/**
Expected result:
1  Vysna   12A  A
2  Devi    12A  B
...
11 Ananya  11A  A
12 Vikram  12B  NULL  ← student exists, no academics!
13 NewKid  10A  NULL  ← student exists, no academics!
← student_id 99 still MISSING
Total: 13 rows

**/

/**-----------------------------------------------------
   ******************** RIGHT JOIN ********************
------------------------------------------------------**/

-- ALL academics + student if exists
SELECT
    s.student_id,
    s.student_name,
    a.academics_grade
FROM students s
RIGHT JOIN students_academics a
ON s.student_id = a.academic_student_id
ORDER BY s.student_id;

/**
Expected result:
1   Vysna   A
2   Devi    B
...
11  Ananya  A
NULL NULL   A  ← academics exists, no student (id 99)!
← Vikram MISSING
← NewKid MISSING
Total: 12 rows
**/

/**-----------------------------------------------------
   ******************** FULL JOIN ********************
------------------------------------------------------**/

SELECT
    s.student_id,
    s.student_name,
    a.academics_grade
FROM students s
LEFT JOIN students_academics a
ON s.student_id = a.academic_student_id
UNION
SELECT
    s.student_id,
    s.student_name,
    a.academics_grade
FROM students s
RIGHT JOIN students_academics a
ON s.student_id = a.academic_student_id
ORDER BY student_id;

/**
Expected result:
1   Vysna   A
2   Devi    B
...
11  Ananya  A
12  Vikram  NULL  ← student, no academics
13  NewKid  NULL  ← student, no academics
NULL NULL   A     ← academics, no student
Total: 14 rows
**/

/**-----------------------------------------------------
****************** THREE TABLE JOIN **************
------------------------------------------------------**/

SELECT
    s.student_name,
    s.student_class,
    a.academics_grade,
    e.extra_allRounder,
    CASE
        WHEN e.extra_student_id IS NULL THEN 'No Extracurriculars'
        WHEN e.extra_allRounder = 1 THEN 'All Rounder! 🏆'
        ELSE 'Partial Activities'
    END AS activity_status
FROM students s
LEFT JOIN students_academics a
    ON s.student_id = a.academic_student_id
LEFT JOIN student_extracurriculars e
    ON s.student_id = e.extra_student_id
ORDER BY a.academics_grade ASC;

/**-----------------------------------------------------
****************** CROSS JOIN **************
------------------------------------------------------**/

-- Every student x every student (combinations)
SELECT
    s1.student_name AS student1,
    s2.student_name AS student2
FROM students s1
CROSS JOIN students s2
WHERE s1.student_id < s2.student_id
ORDER BY s1.student_id;

 
 