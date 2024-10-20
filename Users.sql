CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Mobile NVARCHAR(15) NOT NULL
);


CREATE TABLE Expenses (
    ExpenseId INT PRIMARY KEY IDENTITY(1,1),
    TotalAmount DECIMAL(10, 2) NOT NULL,
    SplitMethod NVARCHAR(50) NOT NULL,
    PaidBy INT NOT NULL,  
    CreatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Expenses_Users FOREIGN KEY (PaidBy) REFERENCES Users(UserId)
);



CREATE TABLE Participants (
    ParticipantId INT PRIMARY KEY IDENTITY(1,1),
    ExpenseId INT NOT NULL,  
    UserId INT NOT NULL,  
    Amount DECIMAL(10, 2) NULL,  
    Percentage DECIMAL(5, 2) NULL,  
    CONSTRAINT FK_Participants_Expenses FOREIGN KEY (ExpenseId) REFERENCES Expenses(ExpenseId),
    CONSTRAINT FK_Participants_Users FOREIGN KEY (UserId) REFERENCES Users(UserId)
);


CREATE TYPE ParticipantList AS TABLE (
    UserId INT,
    Amount DECIMAL(10,2) NULL,
    Percentage DECIMAL(5,2) NULL
);


