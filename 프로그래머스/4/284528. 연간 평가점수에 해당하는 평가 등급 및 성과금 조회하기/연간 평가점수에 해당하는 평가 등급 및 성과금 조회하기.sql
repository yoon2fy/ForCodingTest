SELECT EMP.EMP_NO, -- #1 사번
       EMP.EMP_NAME, -- #2 성명
       -- #3 평가 등급(GRADE)
       CASE
            WHEN AVG(GRA.SCORE) >= 96 THEN 'S'
            WHEN AVG(GRA.SCORE) >= 90 THEN 'A'
            WHEN AVG(GRA.SCORE) >= 80 THEN 'B'
            ELSE 'C'
       END AS GRADE,
       -- #4 성과금(BONUS)
       CASE
            WHEN AVG(GRA.SCORE) >= 96 THEN (EMP.SAL * 0.20)
            WHEN AVG(GRA.SCORE) >= 90 THEN (EMP.SAL * 0.15)
            WHEN AVG(GRA.SCORE) >= 80 THEN (EMP.SAL * 0.10)
            ELSE 0
       END AS BONUS
       
-- HR_DEPARTMENT, HR_EMPLOYEES, HR_GRADE 테이블 JOIN
FROM HR_EMPLOYEES AS EMP
     INNER JOIN HR_GRADE GRA ON GRA.EMP_NO = EMP.EMP_NO

GROUP BY 1
-- 결과는 사번 기준으로 오름차순 정렬해주세요.
ORDER BY 1


# --- 첫 번째 풀이(오답) ----------------------------------
# [고찰]
# 1) 필요없는 테이블을 JOIN 함
# 2) GROUP BY를 안함
# 3) 점수가 상반기-하반기로 나누어져 있기에 평균값으로 구해주어야 함.
# 
# SELECT EMP.EMP_NO, -- #1 사번
#        EMP.EMP_NAME, -- #2 성명
#        -- #3 평가 등급(GRADE)
#        CASE
#             WHEN GRA.SCORE >= 96 THEN 'S'
#             WHEN GRA.SCORE >= 90 THEN 'A'
#             WHEN GRA.SCORE >= 80 THEN 'B'
#             ELSE 'C'
#        END AS GRADE,
#        -- #4 성과금(BONUS)
#        CASE
#             WHEN GRA.SCORE >= 96 THEN (EMP.SAL * 0.20)
#             WHEN GRA.SCORE >= 90 THEN (EMP.SAL * 0.15)
#             WHEN GRA.SCORE >= 80 THEN (EMP.SAL * 0.10)
#             ELSE 0
#        END AS BONUS
       
# -- HR_DEPARTMENT, HR_EMPLOYEES, HR_GRADE 테이블 JOIN
# FROM HR_EMPLOYEES AS EMP
#      INNER JOIN HR_DEPARTMENT DEP ON DEP.DEPT_ID = EMP.DEPT_ID
#      INNER JOIN HR_GRADE GRA ON GRA.EMP_NO = EMP.EMP_NO
     
# -- 사번 기준 오름차순 정렬
# ORDER BY 1