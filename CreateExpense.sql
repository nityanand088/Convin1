CREATE PROCEDURE CreateExpense
    @TotalAmount DECIMAL(10,2),
    @SplitMethod NVARCHAR(50),
    @PaidBy INT,
    @ParticipantsList AS dbo.ParticipantList READONLY 
AS
BEGIN
    BEGIN TRANSACTION;

    DECLARE @ExpenseId INT;
    INSERT INTO Expenses (TotalAmount, SplitMethod, PaidBy)
    VALUES (@TotalAmount, @SplitMethod, @PaidBy);

    SET @ExpenseId = SCOPE_IDENTITY();

    INSERT INTO Participants (ExpenseId, UserId, Amount, Percentage)
    SELECT @ExpenseId, UserId, Amount, Percentage
    FROM @ParticipantsList;

IF @SplitMethod = 'percentage' AND 
   (SELECT SUM(Percentage) FROM @ParticipantsList) != 100
BEGIN
    ROLLBACK TRANSACTION;
    THROW 50000, 'Percentage split must equal 100%', 1;
END;


    COMMIT TRANSACTION;
END;
