SELECT ID,          # 개발자의 ID
       EMAIL,       # 이메일
       FIRST_NAME,  # 이름
       LAST_NAME    # 성

FROM DEVELOPERS

WHERE SKILL_CODE & (
    SELECT CODE
    FROM SKILLCODES
    WHERE NAME ='Python'
    )
    OR SKILL_CODE & (
    SELECT CODE
    FROM SKILLCODES
    WHERE NAME ='C#'
    )
    
ORDER BY ID