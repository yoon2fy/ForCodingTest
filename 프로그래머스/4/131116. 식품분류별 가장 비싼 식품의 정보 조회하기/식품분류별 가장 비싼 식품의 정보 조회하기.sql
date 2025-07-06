SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME -- 식품분류, 식품 가격, 식품 이름 출력
FROM FOOD_PRODUCT
WHERE PRICE IN ( -- 서브쿼리: 식품분류 별 식품 가격이 제일 비싼 식품을 찾기 위함.
        SELECT MAX(PRICE)
        FROM FOOD_PRODUCT
        GROUP BY CATEGORY
    )
    AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY PRICE DESC -- 식품 가격 기준 내림차순 정렬