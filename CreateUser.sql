CREATE PROCEDURE CreateUser
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @Mobile NVARCHAR(15)
AS
BEGIN
    INSERT INTO Users (Name, Email, Mobile)
    VALUES (@Name, @Email, @Mobile);
END;
