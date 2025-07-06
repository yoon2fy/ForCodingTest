-- 두번째 풀이
SELECT YEAR, -- #1 상품을 구매한 년
       MONTH, -- #2 상품을 구매한 월
       COUNT(*) AS PUCHASED_USERS, -- #3 상품을 구매한 회원수
       ROUND(COUNT(*)/ -- 분자 부분 (2021년에 가입한 회원중 상품을 구매한 회원 수)
             (SELECT COUNT(*) -- 분모 부분 (2021년에 가입한 전체 회원 수)
              FROM USER_INFO
              WHERE YEAR(JOINED) = 2021
             ),1) AS PUCHASED_RATIO -- #4 해당 비율
FROM (
    SELECT DISTINCT YEAR(SALE.SALES_DATE) AS YEAR,
           MONTH(SALE.SALES_DATE) AS MONTH,
           USER.USER_ID
    FROM ONLINE_SALE AS SALE
          INNER JOIN USER_INFO AS USER ON SALE.USER_ID = USER.USER_ID
         AND YEAR(USER.JOINED) = 2021
) AS derived_TABLE
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH

# --- 첫번째 풀이 (오답) ---------------------------------------
# SELECT YEAR(SALE.SALES_DATE) AS YEAR,        -- #1 상품을 구매한 년
#        MONTH(SALE.SALES_DATE) AS MONTH,      -- #2 상품을 구매한 월
#        SALE.SALES_AMOUNT AS PURCHASED_USERS, -- #3 상품을 구매한 회원수
#        ROUND(SALE.SALES_AMOUNT/COUNT(USER.USER_ID),1) AS PUCHASED_RATIO 
#        -- #4 상품을 구매한 회원의 비율 
#        -- #4 조건 1: 비율 = 2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수
#        -- #4 조건 2: 소수점 두번째자리에서 반올림

# -- USER_INFO, ONLINE_SALE 테이블 JOIN
# FROM USER_INFO USER
#      INNER JOIN ONLINE_SALE SALE ON USER.USER_ID = SALE.USER_ID

# WHERE YEAR(USER.JOINED) = '2021' -- 2021년에 가입한 전체 회원들 중 ...

# GROUP BY USER.USER_ID
# -- 전체 결과는 년을 기준으로 오름차순 정렬해주시고 년이 같다면 월을 기준으로 오름차순 정렬해주세요.
# ORDER BY 1, 2 