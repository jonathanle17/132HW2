UPDATE loan
SET type = 'TEMP'
WHERE type = 'jumbo mortgage';
/* temp variable for current jumbos */

UPDATE loan
SET type = 'jumbo mortgage'
WHERE type = 'student';
/* update all student loans to jumbo mortgage */

UPDATE loan
SET type = 'student'
WHERE type = 'TEMP';
/* change original jumbos to student loans */