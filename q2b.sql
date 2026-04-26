CREATE TEMPORARY TABLE TargetCustomers AS (
    SELECT DISTINCT b.cname
    FROM borrower b
    JOIN loan l ON b.lno = l.no
    WHERE l.type = 'jumbo mortgage'
)
/* identifies customers who have borrowed a jumbo mortgage loan, creating a temporary table TargetCustomers with their names */

DELETE FROM borrower
WHERE cname IN (SELECT cname FROM TargetCustomers);
/* removes borrower links from customers*/

DELETE FROM borrower
WHERE lno IN (
    SELECT no
    FROM loan
    WHERE type = 'jumbo mortgage'
);
/* removes borrower links from the loans of type 'jumbo mortgage' */

DELETE FROM customer 
WHERE name IN (SELECT cname FROM TargetCustomers);
/* removes customers who have borrowed a jumbo mortgage loan */

DELETE FROM loan
WHERE type = 'jumbo mortgage';
/* removes all loans of type 'jumbo mortgage' */

DROP TABLE TargetCustomers;
/* drops the temporary table TargetCustomers */

