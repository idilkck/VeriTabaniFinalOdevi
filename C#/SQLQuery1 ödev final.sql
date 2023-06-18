create proc SP_Product_Insert
@ProductID int,
@ItemName nvarchar(50),
@Color nvarchar(50),
@Status nvarchar(50)
as
begin
insert into ProductInfo_Tab (ProductId,ItemName,Color,Status)
values(@ProductId,@ItemName,@Color,@Status)
end
-------
create proc SP_Product_View
as
begin
select * from ProductInfo_Tab 
end

------
create proc SP_Product_Update
@ProductID int,
@ItemName nvarchar(50),
@Color nvarchar(50),
@Status nvarchar(50)
as
begin
Update ProductInfo_Tab set ItemName=@ItemName,Color=@Color,Status=@Status where  ProductId=@ProductId
end

----------------
create proc SP_Product_Delete
@ProductID int
as
begin
Delete ProductInfo_Tab  where  ProductId=@ProductId
end

------------------------------
create proc SP_Product_Search
@ProductID int
as
begin
select * from  ProductInfo_Tab  where  ProductId=@ProductId
end

--------------

