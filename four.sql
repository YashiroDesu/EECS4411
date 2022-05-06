SELECT a.custid,
       a.bookid,
       b.genre,
       b.language,
       copies
FROM   (SELECT custid,
               bookid,
               Sum(qnty) AS copies
        FROM   stl.purchase
        GROUP  BY custid,
                  bookid
        HAVING Count(*) > 70) AS a,
       stl.book b
WHERE  a.bookid = b.bookid; 