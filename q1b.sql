SELECT DISTINCT c.name, COUNT(b.lno) AS loanCount
FROM customer c
LEFT JOIN borrower b ON c.name = b.cname
/* joins all customers to their borrowed loans by name */
GROUP BY c.name 
/* groups the results by customer name to count the number of loans each customer has borrowed */