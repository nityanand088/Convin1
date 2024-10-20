CREATE PROCEDURE GetUserExpenses
    @UserId INT
AS
BEGIN
    SELECT e.ExpenseId, e.TotalAmount, e.SplitMethod, e.PaidBy, e.CreatedAt,
           p.Amount, p.Percentage
    FROM Expenses e
    LEFT JOIN Participants p ON e.ExpenseId = p.ExpenseId
    WHERE e.PaidBy = @UserId OR p.UserId = @UserId;
END;
