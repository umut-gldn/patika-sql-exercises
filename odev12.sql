--1. film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT count(*) FROM film 
WHERE length>  (SELECT AVG(length) FROM film);
--2. film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT count(*) FROM film 
WHERE rental_rate = (SELECT max(rental_rate) FROM film);
--3. film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT film_id ,title ,rental_rate  FROM film  
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film) AND replacement_cost =(SELECT MIN(replacement_cost) FROM film)
ORDER BY title;

--4. payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT c.first_name ,c.last_name,COUNT(p.payment_id) FROM customer c 
INNER JOIN payment p  ON c.customer_id =p.customer_id 
GROUP BY c.first_name ,c.last_name
ORDER BY COUNT(p.payment_id) DESC;