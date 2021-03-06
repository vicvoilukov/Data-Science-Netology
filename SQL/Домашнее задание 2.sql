/* Task 1 
Display unique city names from the table of cities*/

SELECT DISTINCT (city)
from city c 
order by city 

/* Task 2
Modify the query from the previous task so that the query displays only those cities 
whose names start with "L" and end with "a" and the names do not contain spaces.*/

select DISTINCT (city)
from city c 
where city like 'L%a' and city not like '% %';

/* Task 3
Obtain from the table of payments for film rental information on payments 
that were made between June 17, 2005 and June 19, 2005 inclusive 
and the cost of which exceeds 1.00. 
Payments must be sorted by payment date.*/

select payment_id, payment_date, amount  
from payment p
where payment_date::date between '2005-06-17' and '2005-06-19'
and amount > 1

/* Task 3
Display information about the last 10 payments for movie rentals.*/

select payment_id, payment_date, amount  
from payment p
order by payment_date desc 
limit 10

/* Task 5
Display the following customer information:
Last name and first name (in one column separated by a space)
Email
The length of the email field value
The date the customer record was last updated (no time)
Give each column a title in Russian.*/

select concat(last_name, ' ', first_name) as "Фамилия и имя",
email as "Электронная почта",
character_length(email) as "Длина Email",
last_update::date as "Дата"
from customer c ;

/*Task 6
Display only active buyers in one query,
whose names are KELLY or WILLIE.
All letters in the last name and first name from uppercase must be converted to lowercase.*/

select 
lower(last_name),
lower(first_name),
active
from customer c 
where active = 1 and first_name ilike 'Kelly' or first_name ilike 'willie' and active = 1


-- ADDITIONAL PART

/*Additional task 1
Display in one query information about films with an R rating 
and a rental price between 0.00 and 3.00 inclusive, 
also films with a PG-13 rating and a rental price greater than or equal to 4.00 */

select film_id, title, description, rating, rental_rate  
from film f 
where rating::text  like 'R' and rental_rate >= 0 and rental_rate <= 3 
or rating = 'PG-13' and rental_rate >= 4

/*Additional task 2
Get information about the three movies with the longest movie description.*/

select film_id, title, description  
from film f
order by character_length(description) desc
limit 3

/*Additional task 3
Display each customer's Email, dividing the Email value into 2 separate columns:
the first column must have the value before the @,
the second column must have the value after the @.*/

select customer_id, 
email, 
split_part(email, '@', 1) as "Email before @",
split_part(email, '@', 2) as "Email after @"
from customer c ;

/*Additional task 4
Refine the query from the previous task, adjust the values in the new columns: 
the first letter should be uppercase, the rest lowercase.*/

select customer_id, 
email,  
concat(substring (split_part(email, '@', 1), 1, 1), lower(substring(split_part(email, '@', 1), 2))) as "Email before @",
concat(initcap(substring (split_part(email, '@', 2), 1, 1)), lower(substring(split_part(email, '@', 2), 2))) as "Email after @"
from customer c ;
