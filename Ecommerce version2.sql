SELECT TOP (1000) [Order_ID]
      ,[Amount]
      ,[Profit]
      ,[Quantity]
      ,[Category]
      ,[Sub_Category]
  FROM [SQL-Project].[dbo].[Order Details]


 -- How much profit comes from each product category?

 select Category , sum(Profit) as Total_Profit 
 from [SQL-Project].[dbo].[Order Details]
 group by Category
 order by Category desc

 -- How much has each customer spent in total?

 select b.CustomerName, sum(a.Amount) as Customer_spent
 from [SQL-Project].[dbo].[Order Details] a
 inner join [SQL-Project].[dbo].[List of Orders] b
 on a.Order_ID = b.Order_ID
 group by b.CustomerName
 order by Customer_spent desc

 --  How many products were sold in each state?
 select b.State , sum(a.Quantity) as Product_Solds
from [SQL-Project].[dbo].[Order Details] a
inner join [SQL-Project].[dbo].[List of Orders] b
on a.Order_ID = b.Order_ID
group by State 
order by Product_Solds desc

--What is the average profit made on each sub-category of products?

select  Sub_Category, avg(Profit) as Avg_Profit 
from [SQL-Project].[dbo].[Order Details] 
group by Sub_Category
order by Avg_Profit desc

--  What's the total spending in each city, broken down by state?

select sum(a.Amount) as Total_spend, b.City , b.State
from [SQL-Project].[dbo].[Order Details] a
inner join [SQL-Project].[dbo].[List of Orders] b
on a.Order_ID = b.Order_ID
group by b.State, b.City

-- Chandigarh is in Punjab State not in Haryana

update [SQL-Project].[dbo].[List of Orders]
set State = 'Punjab'
where City = 'Chandigarh'

---Create a query that shows the Order_ID, CustomerName, Amount, 
--and a new column called Discounted_Amount.  
--Apply a 10% discount to orders where the State is 'Andhra Pradesh' and a 5% discount to orders where the State is 'Maharashtra'.  
--For all other states, apply no discount (i.e., Discounted_Amount is the same as Amount).

select a.Order_ID,b.CustomerName,a.Amount, b.State,
case 
	when b.State = 'Andhra Pradesh' then a.Amount * 0.10
	when b.State = 'Maharashtra' then a.Amount* 0.5
	else Amount
	end as Discounted_Amount
from [SQL-Project].[dbo].[Order Details] a
inner join 
[SQL-Project].[dbo].[List of Orders] b
on a.Order_ID = b.Order_ID


select Sub_Category , count(*) as counting
from [SQL-Project].[dbo].[Order Details]
group by Sub_Category

--Create a query that shows the Order_ID, Category, Sub_Category, and a new column called Product_Type.  
--for example- If the Category is 'Electronics' and the Sub_Category is 'Phones', then Product_Type should be 'Mobile Device'.  

select Order_ID, Category, Sub_Category,

case 
		when Category = 'Electronics' and Sub_Category in ('Printers','Electronic Games','Phones', 'Accessories') then 'Technology'
		when Category = 'Furniture' and Sub_Category in ('Furnishings','Chairs','Bookcases', 'Tables') then 'Home Items'
		when Category = 'Clothing' and Sub_Category in ('Hankerchief','T-shirt','Leggings', 'Skirt','Kurti','Saree','Trousers','Stole') then 'Fashion'
		else 'Other'
		end as 'Product_Type'
from [SQL-Project].[dbo].[Order Details]



