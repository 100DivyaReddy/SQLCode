SELECT company_code
    , founder
    , (SELECT COUNT(DISTINCT lead_manager_code)
        FROM Lead_Manager lm
        WHERE lm.company_code = c.company_code)
    , (SELECT COUNT(DISTINCT senior_manager_code)
        FROM Senior_Manager sm
        JOIN Lead_Manager lm ON sm.lead_manager_code = lm.lead_manager_code
        WHERE sm.company_code = c.company_code)
    , (SELECT COUNT(DISTINCT manager_code)
        FROM Manager m 
        JOIN Senior_Manager sm ON m.senior_manager_code = sm.senior_manager_code
        JOIN Lead_Manager lm ON sm.lead_manager_code = lm.lead_manager_code
        WHERE sm.company_code = c.company_code)
    , (SELECT COUNT(DISTINCT employee_code)
        FROM Employee e
        JOIN Manager m ON e.manager_code = m.manager_code
        JOIN Senior_Manager sm ON m.senior_manager_code = sm.senior_manager_code
        JOIN Lead_Manager lm ON sm.lead_manager_code = lm.lead_manager_code
        WHERE sm.company_code = c.company_code)
FROM Company c
ORDER BY LEFT(company_code,1), SUBSTRING(company_code,2,(LEN(company_code)-1))
