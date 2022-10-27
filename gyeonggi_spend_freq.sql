WITH CTE AS
(SELECT 시군구명
	   ,SUM(총결제금액) '총결제금액'
  FROM gyeonggi_spend
 GROUP BY 시군구명)
 
 SELECT 시도명
	   ,gf.시군구명
       ,gf.행정구역
       ,CTE.총결제금액
       ,SUM(사용빈도) '사용빈도'
   FROM gyeonggi_freq gf
	   INNER JOIN CTE ON gf.시군구명 = CTE.시군구명
  GROUP BY 시도명, 시군구명