-- 코드를 작성해주세요
SELECT SUM(GRADE.SCORE) AS SCORE, # 점수
       EMP.EMP_NO,      # 사번
       EMP.EMP_NAME,    # 성명
       EMP.POSITION,    # 직책
       EMP.EMAIL        # 이메일
       
FROM HR_DEPARTMENT AS DEPT
     INNER JOIN HR_EMPLOYEES AS EMP
        ON DEPT.DEPT_ID = EMP.DEPT_ID
     INNER JOIN HR_GRADE AS GRADE
        ON EMP.EMP_NO = GRADE.EMP_NO

GROUP BY EMP_NO # 사번을 기준으로 그룹화 함.

ORDER BY SCORE DESC
LIMIT 1


