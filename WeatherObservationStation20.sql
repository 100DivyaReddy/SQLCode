WITH Temp(LAT_N, Row_Num)
AS
(SELECT LAT_N
    , ROW_NUMBER() OVER(ORDER BY LAT_N) [Row_Num]
FROM Station)

SELECT CAST(LAT_N AS decimal(10,4))
FROM Temp
WHERE Row_Num = (SELECT (COUNT(LAT_N)/2 + 1)
                             FROM Station)