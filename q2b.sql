DELETE FROM borrower
WHERE lno IN (
    SELECT no
    FROM loan
    WHERE type = 'jumbo mortgage'
);
/* deletes all borrowers (children) of jumbo mortgage loans */

DELETE FROM customer
WHERE name IN (
    SELECT b.cname
    FROM borrower b
    JOIN loan l ON b.lno = l.no
    WHERE l.type = 'jumbo mortgage'
);
/* deletes all customers (parents) of jumbo mortgage loans, which will also delete their borrowers due to cascade delete */

DELETE FROM loan
WHERE type = 'jumbo mortgage';
/* deletes all jumbo mortgage loans, which will also delete their borrowers due to cascade delete */
