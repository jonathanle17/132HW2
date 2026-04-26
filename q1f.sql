SELECT c1.name AS name1, c2.name AS name2
FROM customer c1
JOIN customer c2 ON c1.name < c2.name
WHERE NOT EXISTS (
    /* checks if there is a loan that c1 has borrowed but c2 has not */
    SELECT b1.lno
    FROM borrower b1
    WHERE b1.cname = c1.name
    AND b1.lno NOT IN(
        SELECT b2.lno
        FROM borrower b2
        WHERE b2.cname = c2.name
    )
)
AND NOT EXISTS (
    /* checks if there is a loan that c2 has borrowed but c1 has not */
    SELECT b2.lno
    FROM borrower b2
    WHERE b2.cname = c2.name
    AND b2.lno NOT IN (
        SELECT b1.lno
        FROM borrower b1
        WHERE b1.cname = c1.name
    )
);