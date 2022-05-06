WITH a
     AS (SELECT language,
                genre,
                publisher,
                Count(*)
         FROM   stl.book
         GROUP  BY language,
                   genre,
                   publisher
         HAVING Count(*) > 10),
     b
     AS (SELECT 	 p.custid,
                         language,
                         genre,
                         publisher,
                         count(distinct bookid)
         FROM   stl.purchase p,
                stl.book b
         WHERE  b.bookid = p.bookid
                AND custid < 500
         GROUP  BY p.custid,
                   language,
                   genre,
                   publisher
         HAVING Count(*) > 10)
SELECT custid,
       a.language,
       a.genre,
       a.publisher
FROM   a,
       b
WHERE  a.language = b.language
       AND a.genre = b.genre
       AND a.publisher = b.publisher
       AND a.count = b.count; 