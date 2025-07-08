-- 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력
SELECT MEM.MEMBER_NAME,                                #1 회원 이름
       REST.REVIEW_TEXT,                                        #2 리뷰 텍스트
       DATE_FORMAT(REST.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE #3 리뷰 작성일

FROM MEMBER_PROFILE AS MEM 
     INNER JOIN REST_REVIEW AS REST
     ON MEM.MEMBER_ID = REST.MEMBER_ID

-- 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회
WHERE REST.MEMBER_ID = (SELECT MEMBER_ID
                        FROM REST_REVIEW
                        GROUP BY MEMBER_ID
                        ORDER BY COUNT(REVIEW_SCORE) DESC
                        LIMIT 1
                       )

-- 리뷰 작성일 기준 오름차순, 리뷰 텍스트를 기준으로 오름차순 정렬
ORDER BY 3, 2;