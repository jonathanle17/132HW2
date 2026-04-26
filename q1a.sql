SELECT DISTINCT c.name AND l.no
FROM customer c
JOIN borrower b ON c.name = b.cname
/* joins all borrowers to their customer table with credit score by name */
JOIN loan l ON b.lno = l.no
/* joins all loans to their borrower by loan number, connecting minCredit to customer credit score */
WHERE c.credit < l.minCredit;

