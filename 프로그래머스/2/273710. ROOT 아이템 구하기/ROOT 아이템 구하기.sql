SELECT A.ITEM_ID,
       A.ITEM_NAME

FROM ITEM_INFO AS A
     INNER JOIN ITEM_TREE AS B
     ON A.ITEM_ID = B.ITEM_ID


WHERE B.PARENT_ITEM_ID IS NULL -- ROOT 아이템을 찾는 것이라고 생각을 했다.


ORDER BY A.ITEM_ID -- 아이템 id를 기준으로 정렬을 하는거라고 생각을 했다.