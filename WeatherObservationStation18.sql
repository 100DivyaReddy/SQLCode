SELECT ABS(CAST(MAX(LAT_N) AS decimal(10,4)) - CAST(MIN(LAT_N) AS decimal(10,4))) + ABS(CAST(MAX(LONG_W) AS decimal(10,4)) - CAST(MIN(LONG_W) AS decimal(10,4)))
FROM Station
