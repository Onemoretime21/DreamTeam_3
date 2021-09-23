--1. ������� ����� �������� �� Kivano ����� ������� �� ������� � ���������� �� Sulpak.

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

--2. ������� ����� ��������� ������ Iphone � ���������.


/* Kivano
select k.product_name, k.price 
from kivano k 
where k.product_name = 'Iphone 12'

--Sulpak
select s.product_name, s.price 
from sulpak s 
where s.product_name = 'Iphone 12'
*/





--3. �������� �� ����� ������ ���� ��������� �� sulpak � 
--������ ��� ��������� ������� ����� ���������� ���� ������ � ����������� �� ������� kivano.

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


--4. �������� ��� ��������� ��������.

/*--���������� ���� id � ���� ������ ����� ��� ��������
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

--5. �������� ������, ������� ������� �������� ������ �������� � ������� �� ����������.\

/*
select
k1.product_name,
p2.prodused_date
from
	kivano k1 ,
	produsers p2
where k1.produser_id = p2.produser_id
order by p2.prodused_date asc*/


--6. ������� ������, ������� ���� � kivano �� ��� � sulpak.

/*select
	*
from
	kivano k
left join sulpak s on
	k.product_name = s.product_name
where s.product_name is null*/

--7. ������� ��� ������ � �������� sulpak, ��� ��������-������������� �������� ����� "m" � �����.

/*select
	s.product_name, p.produser_company 
from
	sulpak s,
	produsers p
where
	s.produser_id = p.produser_id
	and p.produser_company like '%m%'*/

--8. ������� ������, ������� ���� � � kivano u sulpak.

/*select
	k.product_name,
	s.product_name
from
	kivano k
inner join sulpak s on
	k.product_name = s.product_name*/

--9. ������� ��������� ������ �� kivano, ������� � �������� �������� "k".

/*select
	k.product_name
from
	kivano k
where
	k.product_name like '%k%'*/


--10. ������� ����� ��������� ����������� ����� � ������� produsers, � ��������� �������� �� Apple, � ������ �� kyrgyzstan.
--���������� �� ���� ����������
/*select * from produsers p 
order by p.prodused_date desc
--������ �� ����� ��������
update produsers set produser_company='Apple' where produser_id = 52;
update produsers set produser_country='Kyrgyzstan' where produser_id =52;*/

--11. ����� ���������� 2 �������� �� product_name � ������� �� ����� ��� �������� � ��� ���� �� ����� ���������,
--������ �� ���� ��� � ����� ��������� ����� ���������� ������, ������� ����� join��� �� ������.

/*select
	k.product_name,
	k.price,
	s.product_name,
	s.price
from
	kivano k
full outer join sulpak s on
	k.product_name = s.product_name*/


--12. ������� ����� ��������� �������� ����� ������� ��� �������� � produsers.
/*--����� id ��� ������ ���������
select p.produser_id, max(p.prodused_date) from produsers p 
where p.produser_country = 'Japan'
group by p.produser_id
order by p.prodused_date desc

--������������� id
select
	k.product_name,
	s.product_name
from
	kivano k
full outer join sulpak s on
	k.produser_id = s.produser_id
where
	k.produser_id = 9*/


--13. �������� ������, ������� �������� 1000 � ���� ���� ��������� � sulpak.

/*select
	s.product_name,
	s.price as old_price,
	(s.price + 1000) as new_price
from
	sulpak s*/

--14. ������ ������� ����� ����� ������� ����� � sulpak � ����� ������ ����� ����� � kivano.

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


--15. �������� �� ����� ���� ����� ������� ��������� �� ����� ���������.

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

--16. ������� ��� ������ ��� ���� NULL � product_name � ����� ���������.

/*delete from sulpak s
where s.product_name is null;
commit;

delete from kivano k
where k.product_name is null;
commit;*/

--17. ��� �������� � ������� ��� ������ 1998 �������� �� 2000 (��������� � ������� psycopg2)

--Skiiip �����

--18. Acer ������ ���� ������� � �������� ����� 2012 ���� � �������� � ��������, 
--� ���� ������� � produsers ��� Acer ��� ���������� � Brazil ����� 2012 ��������� Germany.

--������� ��� ������ �� ������� ��� �������
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


-- 19. �������� ������ 16 ������� ��� id, �� kivano.

/*select
	k.product_name,
	k.price
from
	kivano k
limit 16*/


--20. �������� �� ����� ��� product_name ������� ��������� � ��������� laptops � kivano.
/*select
	k.product_name,
	c.category_name
from
	kivano k,
	categories c
where
	k.category_id = c.category_id
	and c.category_id = 2*/

--21. ������� ������ � sulpak, ���� ������� ������ �������� �� 2000 � ������ ������� �� 2000


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
 
--22. ������� product_company, ��� ������ ������ �������� � kivano.

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

--23. ������� ����� ������� ����� ���������� � ������� sulpak.


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

--24. ��������� ������ �� South Korea ����� ��� ������ Korea � �������� Asus.

--���� id ��� ������
/*select * from produsers p 
where p.produser_country = 'Korea' and p.produser_company = 'Asus'

--������ �� ����� ��������
update produsers set produser_country='South Korea' where produser_id in (17,60);*/


--25. � producers ��������� Nokia �� Microsoft ����� ��� � �������� Nokia ������� ������ USA.

/*select * from produsers p 
where p.produser_country = 'USA' and p.produser_company = 'Nokia'

--������ �� ����� ��������
update produsers set produser_company ='Microsoft' where produser_id = 14;*/
