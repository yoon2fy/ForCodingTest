-- 진료예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약일시 항목 출력
SELECT APNT.APNT_NO, -- #1 진료예약번호
       PT.PT_NAME,   -- #2 환자이름
       APNT.PT_NO,   -- #3 환자번호
       APNT.MCDP_CD, -- #4 진료과코드
       DR.DR_NAME,   -- #5 의사이름
       APNT.APNT_YMD -- #6 진료예약일시
       
-- PATIENT, DOCTOR 그리고 APPOINTMENT 테이블을 JOIN
FROM APPOINTMENT APNT
     INNER JOIN PATIENT PT ON PT.PT_NO = APNT.PT_NO
     INNER JOIN DOCTOR DR ON DR.DR_ID = APNT.MDDR_ID

-- 2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역을 조회하는 SQL문을 작성해주세요. 
WHERE (APNT.APNT_YMD LIKE '2022-04-13%') -- 2022년 4월 13일 내역 중에서 ...
      AND (APNT.APNT_CNCL_YN = 'N')      -- 예약이 취소가 되지 않은 내역 중에서 ...
      AND (APNT.MCDP_CD = 'CS')          -- 흉부외과(CD) 진료내역...
ORDER BY 6 -- 진료예약일시 기준으로 오름차순 정렬