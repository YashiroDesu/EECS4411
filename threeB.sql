SELECT bookid,
       Sum(sale) AS total
FROM   stl.purchase
WHERE  whenp BETWEEN '01/01/2012' AND '01/31/2012'
       AND qnty = 10
GROUP  BY bookid; 