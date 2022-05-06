SELECT *
FROM   stl.purchase p,
       stl.book b
WHERE  b.bookid = p.bookid; 