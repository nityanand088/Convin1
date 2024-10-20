CREATE PROCEDURE GetBalanceSheet
    @UserId INT
AS
BEGIN
    SELECT e.ExpenseId, e.TotalAmount, e.SplitMethod, e.PaidBy,
           CASE 
               WHEN e.PaidBy = @UserId THEN SUM(p.Amount) - e.TotalAmount
               ELSE p.Amount
           END AS Balance
    FROM Expenses e
    LEFT JOIN Participants p ON e.ExpenseId = p.ExpenseId
    WHERE e.PaidBy = @UserId OR p.UserId = @UserId
    GROUP BY e.ExpenseId, e.TotalAmount, e.SplitMethod, e.PaidBy, p.Amount;
END;
