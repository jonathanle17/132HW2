WITH LoanBorrowerCounts AS (
    /* counts the number of borrowers for each loan */
    SELECT l.no, l.type, COUNT(b.cname) AS borrowerCount
    FROM loan l
    LEFT JOIN borrower b ON l.no = b.lno
    GROUP BY l.no, l.type
),
TypeAverages AS (
    /* calculates the average number of borrowers for each loan type */
    SELECT type, AVG(borrowerCount) AS avgBorrowers
    FROM LoanBorrowerCounts
    GROUP BY type
)
SELECT lbc.no
FROM LoanBorrowerCounts lbc
JOIN TypeAverages ta ON lbc.type = ta.type
/* check each loan number count against the average for its type */
WHERE lbc.borrowerCount > ta.avgBorrowers
