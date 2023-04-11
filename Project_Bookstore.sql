/* Bulk_Bookstore Project */
use bookstore;
select * from books limit 10; # Sample Data from Books table
select * from book_price limit 10; # Sample Data from Books table
# Total number of books:
select count(Title) from books;
# Publishers:
select publisher,count(publisher) from books group by publisher;
# Languages:
select Language,count(Language) from books group by Language;
# Formats:
select count(Format),Format from books group by Format;
# Availability:
select Availability,count(Availability) from book_price group by 1;
# Condition:
select Item_condition,count(Item_condition) from book_price group by 1;
#  Maximum, minimum and average weight books:
select max(weight) as max_weight, min(weight) as min_weight, avg(weight) as avg_weight from book_price;
# Latest and Oldest published book date: 
select max(Date), min(Date) from books;
# Common height and width of books:
select height,count(height) from book_price group by height order by count(height) desc limit 1;
select width,count(width) from book_price group by 1 order by count(width) desc limit 1;
# Maximum, minimum, average price of books: 
select max(Price) as max_price, min(Price) as min_price, avg(Price) as avg_price from book_price;
# Maximum, minimum, average pages of books: 
select max(Pages) as max_pages, min(Pages) as min_pages, avg(Pages) as avg_pages from book_price;
# Average number of pages per Language:
select books.Language, avg(book_price.Pages) from books join book_price on books.Title=book_price.Title group by Language;
# Number of Authers per Languages: 
select Language, count(distinct Author) from books group by Language;
# Maximum, minimum, average case packs of books: 
select max(Case_pack) as max_case_pack, min(Case_pack) as min_case_pack, avg(Case_pack) as avg_case_pack from book_price;
# Books written by multiple Authers per language: 
select Language, count(Title) from books where Author like '%,%' group by Language;
# ISBN numbers, title, Author of top 3 books as per their prices: 
select books.ISBN, books.Title, books.Author, book_price.Price from books join book_price on books.Title=book_price.Title order by Price desc limit 3;
# ISBN numbers, title, Author of bottom 3 books as per their prices: 
select books.ISBN, books.Title, books.Author, book_price.Price from books join book_price on books.Title=book_price.Title order by Price limit 3;
# Number of books per alphabet in each language: 
select left(Title, 1),count(left(Title, 1)) from books group by left(Title, 1) order by  left(Title, 1);
# Total number of books published per year:
select YEAR(Date),count(Title) from books group by YEAR(Date);
# Comparison of prices of book written in each language:
select books.Language, avg(book_price.Price) from books join book_price on books.Title=book_price.Title group by Language;
# Name of Auther with maximum number of books- top 5:
select distinct Author,count(Author) as number_of_books from books group by Author order by count(Author) desc limit 5;