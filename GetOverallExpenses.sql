CREATE PROCEDURE GetOverallExpenses
AS
BEGIN
    SELECT e.ExpenseId, e.TotalAmount, e.SplitMethod, e.PaidBy, e.CreatedAt,
           p.UserId, p.Amount, p.Percentage
    FROM Expenses e
    LEFT JOIN Participants p ON e.ExpenseId = p.ExpenseId;
END;
