-- SP_Product_Insert saklanmış prosedürü için tetikleyici
CREATE TRIGGER trgProductInsert
ON ProductInfo_Tab
AFTER INSERT
AS
BEGIN
    -- INSERT işlemi gerçekleştiğinde yapılacak eylemler
    DECLARE @ProductId INT;
    DECLARE @ItemName NVARCHAR(50);
    DECLARE @Color NVARCHAR(50);
    DECLARE @Status NVARCHAR(50);

    -- Eklenen kayıtları al
    SELECT @ProductId = ProductId, @ItemName = ItemName, @Color = Color, @Status = Status
    FROM inserted;

    -- Tetikleyici eylemleri
    -- Örneğin, başka bir tabloya veri ekleyebilir veya güncelleyebilirsiniz
    INSERT INTO ProductLog (ProductId, Action, LogDate)
    VALUES (@ProductId, 'Insert', GETDATE());
END;

-- SP_Product_Update saklanmış prosedürü için tetikleyici
CREATE TRIGGER trgProductUpdate
ON ProductInfo_Tab
AFTER UPDATE
AS
BEGIN
    -- UPDATE işlemi gerçekleştiğinde yapılacak eylemler
    DECLARE @ProductId INT;
    DECLARE @ItemName NVARCHAR(50);
    DECLARE @Color NVARCHAR(50);
    DECLARE @Status NVARCHAR(50);

    -- Değiştirilen kayıtları al
    SELECT @ProductId = ProductId, @ItemName = ItemName, @Color = Color, @Status = Status
    FROM inserted;

    -- Tetikleyici eylemleri
    -- Örneğin, başka bir tabloyu güncelleyebilir veya loglama yapabilirsiniz
    INSERT INTO ProductLog (ProductId, Action, LogDate)
    VALUES (@ProductId, 'Update', GETDATE());
END;

-- SP_Product_Delete saklanmış prosedürü için tetikleyici
CREATE TRIGGER trgProductDelete
ON ProductInfo_Tab
AFTER DELETE
AS
BEGIN
    -- DELETE işlemi gerçekleştiğinde yapılacak eylemler
    DECLARE @ProductId INT;

    -- Silinen kaydı al
    SELECT @ProductId = ProductId
    FROM deleted;

    -- Tetikleyici eylemleri
    -- Örneğin, başka bir tabloya veri ekleyebilir veya loglama yapabilirsiniz
    INSERT INTO ProductLog (ProductId, Action, LogDate)
    VALUES (@ProductId, 'Delete', GETDATE());
END;
------------
CREATE TRIGGER trgProductSearch
ON ProductInfo_Tab
INSTEAD OF SELECT
AS
BEGIN
    DECLARE @ProductID int;
    SET @ProductID = (SELECT TOP 1 @ProductID FROM inserted); -- Aranan ProductID'yi alın
    SELECT * FROM ProductInfo_Tab WHERE ProductID = @ProductID;
END
