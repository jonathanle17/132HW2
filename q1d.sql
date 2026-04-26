SELECT DISTINCT name
FROM customer
WHERE name NOT IN (
    /* selects all customers who are not missing any loan types */
    SELECT ALL_POSSIBLE.name
    FROM (
        SELECT c.name, t.type
        FROM customer c, (SELECT DISTINCT type FROM loan) t
        /* creates a cross join of all customers on all distinct loan types */
    ) AS ALL_POSSIBLE
    LEFT JOIN (
        /* left join so if a possible combo not actually present, then noted */
        /* select all borrowers with their loan types */
        SELECT DISTINCT b.cname, l.type
        FROM borrower b
        JOIN loan l ON b.lno = l.no
    ) AS ACTUAL
    ON ALL_POSSIBLE.name = ACTUAL.cname
    AND ALL_POSSIBLE.type = ACTUAL.type
    WHERE ACTUAL.cname IS NULL
    /* selects names of all customers who do not have all possible loans, missing at least one possible loan type */
)
