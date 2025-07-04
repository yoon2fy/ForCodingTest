SELECT COUNT(A.FISH_NAME) AS FISH_COUNT, A.FISH_NAME
FROM FISH_NAME_INFO AS A
     INNER JOIN FISH_INFO AS B
     ON A.FISH_TYPE = B.FISH_TYPE
GROUP BY A.FISH_NAME
ORDER BY 1 DESC