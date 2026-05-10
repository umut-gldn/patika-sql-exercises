--1. city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country) isimlerini birlikte görebileceğimiz LEFT JOIN sorgusunu yazınız.
SELECT c.city ,co.country  FROM city c
LEFT JOIN country co ON co.country_id =c.country_id 
ORDER BY co.country;

--2. customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz RIGHT JOIN sorgusunu yazınız.
SELECT p.payment_id ,c.first_name ,c.last_name  FROM customer c 
RIGHT JOIN payment p ON c.customer_id =p.customer_id 
ORDER BY p.payment_id;

--3. customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz FULL JOIN sorgusunu yazınız.
SELECT r.rental_id ,c.first_name ,c.last_name  FROM customer c 
FULL JOIN rental r ON r.customer_id =c.customer_id 
ORDER BY r.rental_id;