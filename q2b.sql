DELETE FROM borrower
WHERE lno IN (
    SELECT no 
    FROM loan
    WHERE type = 'jumbo mortgage'
);
/* deletes from borrowers (children) so no link between parents of customers and loans */

DELETE FROM customer
WHERE name IN (
    SELECT b.cname
    FROM borrower b
    JOIN loan l ON b.lno = l.no
    WHERE l.type = 'jumbo mortgage'
);
/* looks for names of borrowers who have loans of type 'jumbo mortgage' */
/* deletes from customers (parents) so no link between parents of customers and loans */

DELETE FROM loan
WHERE type = 'jumbo mortgage';
/* deletes from loans (parents) so no link between parents of customers and loans */