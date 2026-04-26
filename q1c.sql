SELECT l.type AS loanType
FROM loan l
LEFT JOIN borrower b ON l.no = b.lno
/* joins all loans to their borrower by loan number */
GROUP BY l.type
/* group all loans by distinct types with their respective counts */
HAVING COUNT(b.cname) = (
    SELECT MIN(borrowerCount) 
    /* select loan type with least count of borrowers */
    FROM (
        SELECT COUNT(b2.cname) AS borrowerCount 
        /* counts number of names from borrower table */
        FROM loan l2
        LEFT JOIN borrower b2 ON l2.no = b2.lno
        /* joins all loans to their borrower by loan number */
        /* left join still includes loans with no borrowers */
        GROUP BY l2.type
        /* group all loans by distinct types with their respective counts */
    ) AS typeCounts
)
/* group all loans by type with their resective counts */
/* select the loan type with least count MIN() */