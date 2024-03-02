use Medical_Exam;

SELECT Week_day, FORMAT(SUM(Profit), '0.00') AS Total_Profit
FROM Results
GROUP BY Week_day
go



SELECT Staff, COUNT(Shift)
FROM Results
GROUP BY Staff
go



SELECT 
    Staff,
    COUNT(CASE WHEN Shift = 'Day' THEN 1 END) AS DayCount,
    COUNT(CASE WHEN Shift = 'Night' THEN 1 END) AS NightCount


FROM Results
GROUP BY Staff;
go


SELECT 
    Staff,
    COUNT(CASE WHEN Shift = 'Day' THEN 1 END) * 40 AS DayIncome,
    COUNT(CASE WHEN Shift = 'Night' THEN 1 END)  * 50 AS NightIncome,
	(COUNT(CASE WHEN Shift = 'Day' THEN 1 END) * 40) + ( COUNT(CASE WHEN Shift = 'Night' THEN 1 END)  * 50 ) As TotalIncome

FROM Results
GROUP BY Staff;

go



SELECT * 
FROM Results