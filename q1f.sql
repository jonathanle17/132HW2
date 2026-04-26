SELECT b1.cname AS name1, b2.cname AS name2
FROM borrower b1
JOIN borrower b2 ON b1.lno = b2.lno 
/* joins the borrower table to itself on loan number to find pairs of customers who borrowed the same loan */
WHERE b1.cname < b2.cname
/* ensures that each pair is only counted once by enforcing an alphabetical order on the names */
GROUP BY b1.cname, b2.cname
HAVING COUNT (*) = (
    /* if their shared counts of loans matches total, then they share all same loans */
    SELECT COUNT(*) 
    FROM borrower b3
    WHERE b3.cname = b1.cname
    /* counts the number of loans borrowed by the first customer in the pair */
) AND COUNT (*) = (
    SELECT COUNT(*) 
    FROM borrower b4
    WHERE b4.cname = b2.cname
    /* counts the number of loans borrowed by the second customer in the pair */
)
