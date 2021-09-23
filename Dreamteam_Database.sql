--1. Узнайте какие телефоны из Kivano стоят столько же сколько и компьютеры из Sulpak.

/*
select * from
(
select
	c1.category_name,
	k.product_name,
	k.price
from
	kivano k,
	categories c1
where
	k.category_id = c1.category_id
	and k.category_id = 1) x1,
(
select
	c2.category_name,
	s.product_name ,
	s.price
from
	sulpak s ,
	categories c2
where
	s.category_id = c2.category_id
	and s.category_id = 2) x2
where x1.price = x2.price
*/

--2. Узнайте самую последнюю модель Iphone в магазинах.


/* Kivano
select k.product_name, k.price 
from kivano k 
where k.product_name = 'Iphone 12'

--Sulpak
select s.product_name, s.price 
from sulpak s 
where s.product_name = 'Iphone 12'
*/





--3. Выведите на экран список всех ноутбуков из sulpak и 
--только тех телефонов которые имеют одинаковую дату выхода с компьютером из таблицы kivano.

/*select * from
(
select
s1.product_name,
c1.category_name,
p1.created_at 
from
	sulpak s1,
	produsers p1,
	categories c1
where s1.produser_id = p1.produser_id
	and s1.category_id = 2
	and c1.category_id = s1.category_id) x1,
(
select
k1.product_name,
c2.category_name,
p2.created_at 
from
	kivano k1 ,
	produsers p2,
	categories c2
where k1.produser_id = p2.produser_id
	and k1.category_id = 1
	and c2.category_id = k1.category_id) x2
where x1.created_at = x2.created_at*/


--4. Выведите все китайские продукты.

/*--Нахождения всех id у кого страна Китай для запросов
select * from produsers p
where p.produser_country = 'China'

select
	k.product_name,
	s.product_name
from
	kivano k,
	sulpak s 
where
k.produser_id  = s.produser_id 
and k.produser_id in (68,
52,
47,
25,
21,
16,
11,
5)*/

--5. Напишите запрос, который выводит продукты любого магазина в порядке их добавления.\

/*
select
k1.product_name,
p2.prodused_date
from
	kivano k1 ,
	produsers p2
where k1.produser_id = p2.produser_id
order by p2.prodused_date asc*/


--6. Найдите товары, которые есть в kivano но нет в sulpak.

/*select
	*
from
	kivano k
left join sulpak s on
	k.product_name = s.product_name
where s.product_name is null*/

--7. Найдите все товары в магазине sulpak, где компания-производитель содержит букву "m" в имени.

/*select
	s.product_name, p.produser_company 
from
	sulpak s,
	produsers p
where
	s.produser_id = p.produser_id
	and p.produser_company like '%m%'*/

--8. Найдите товары, которые есть и в kivano u sulpak.

/*select
	k.product_name,
	s.product_name
from
	kivano k
inner join sulpak s on
	k.product_name = s.product_name*/

--9. Найдите китайские товары из kivano, которые в названии содержат "k".

/*select
	k.product_name
from
	kivano k
where
	k.product_name like '%k%'*/


--10. Найдите самый последний добавленный товар в таблице produsers, и поменяйте компанию на Apple, и страну на kyrgyzstan.
--Сортировка по дате добавления
/*select * from produsers p 
order by p.prodused_date desc
--Замена на новые значения
update produsers set produser_company='Apple' where produser_id = 52;
update produsers set produser_country='Kyrgyzstan' where produser_id =52;*/

--11. Нужно объеденить 2 магазина по product_name и вывести на экран имя продукта и его цену из обоих магазинов,
--однако не факт что в обоих магазинах будут одинаковые товары, поэтому нужно joinить по полной.

/*select
	k.product_name,
	k.price,
	s.product_name,
	s.price
from
	kivano k
full outer join sulpak s on
	k.product_name = s.product_name*/


--12. Найдите самый последний японский товар который был добавлен в produsers.
/*--Поиск id для таблиц магазинов
select p.produser_id, max(p.prodused_date) from produsers p 
where p.produser_country = 'Japan'
group by p.produser_id
order by p.prodused_date desc

--Использование id
select
	k.product_name,
	s.product_name
from
	kivano k
full outer join sulpak s on
	k.produser_id = s.produser_id
where
	k.produser_id = 9*/


--13. Напишите запрос, который прибавит 1000 к цене всех продуктов в sulpak.

/*select
	s.product_name,
	s.price as old_price,
	(s.price + 1000) as new_price
from
	sulpak s*/

--14. Узнать разницу между самой высокой ценой в sulpak и самой низкой ценой товар в kivano.

/*select
	(
	select
		s.price as sulpak_max_price
	from
		sulpak s
	where
		s.price in (
		select
			max(s1.price)
		from
			sulpak s1)
		) -		
(
	select
		distinct k.price as kivano_min_price
	from
		kivano k
	where
		k.price in (
		select
			min(k1.price)
		from
			kivano k1)
		)*/


--15. Выведите на экран цены самых дешёвых телефонов из обоих магазинов.

--
/*select
	k.product_name,
	k.price
from
		kivano k
where
		k.price in (
	select
			min(k1.price)
	from
			kivano k1
	where
		k1.category_id = 1)
--
select
	s.product_name,
	s.price
from
		sulpak s
where
		s.price in (
	select
			min(s1.price)
	from
			sulpak s1
	where
		s1.category_id = 1)*/

--16. Удалить все записи где есть NULL в product_name в обоих магазинах.

/*delete from sulpak s
where s.product_name is null;
commit;

delete from kivano k
where k.product_name is null;
commit;*/

--17. Все телефоны у которых год меньше 1998 изменить на 2000 (Выполнить с помощью psycopg2)

--Skiiip сразу

--18. Acer закрыл свою фабрику в Бразилии после 2012 года и переехал в Германию, 
--у всех записей в produsers где Acer был произведен в Brazil после 2012 поставьте Germany.

--Записей для замены не найдены под условия
/*
select
	*
from
	produsers p
where
	p.produser_country = 'Brazil'
	and p.produser_company = 'Aser'
	and p.produser_id > 2012-01-01
*/


-- 19. Выведите первые 16 записей без id, из kivano.

/*select
	k.product_name,
	k.price
from
	kivano k
limit 16*/


--20. Выведите на экран все product_name которые относятся к категории laptops в kivano.
/*select
	k.product_name,
	c.category_name
from
	kivano k,
	categories c
where
	k.category_id = c.category_id
	and c.category_id = 2*/

--21. Найдите товары в sulpak, цена которых больше среднего на 2000 и меньше средний на 2000


/*select
	s.product_name,
	s.price
from
	sulpak s
where
	s.price between (
	select
		avg(s1.price)
	from
		sulpak s1)-2000 and (
	select
		avg(s1.price)
	from
		sulpak s1)+ 2000*/
 
--22. Найдите product_company, чьи товары дороже среднего в kivano.

/*select
	k.product_name,
	k.price
from
	kivano k
where
	k.price > (
	select
		avg(k1.price)
	from
		kivano k1)*/

--23. Найдите товар который лежит посередине в таблице sulpak.


/*select
	x1.product_name,
	x1.rnumber
	from
(select
		d1.product_name,
		row_number() over(
		order by d1.product_name) as rnumber
	from
		sulpak d1) x1
where
	x1.rnumber = (
	select
		count(*)/2
	from
		sulpak s)*/

--24. Поменяйте страну на South Korea везде где страна Korea и компания Asus.

--Ищем id для замены
/*select * from produsers p 
where p.produser_country = 'Korea' and p.produser_company = 'Asus'

--Замена на новые значения
update produsers set produser_country='South Korea' where produser_id in (17,60);*/


--25. В producers поменяйте Nokia на Microsoft везде где у компании Nokia указана страна USA.

/*select * from produsers p 
where p.produser_country = 'USA' and p.produser_company = 'Nokia'

--Замена на новые значения
update produsers set produser_company ='Microsoft' where produser_id = 14;*/
