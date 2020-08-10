-- # Запросы

-- ## Администрирование

-- ### Создание Базы и пользователя
create user student@'%' identified by 'studentPW';
create database project;
grant all privileges on project.* TO student@'%';
flush privileges;

-- ## Выборка данных

-- ### Задание 1 - Все датчики
select * from datchiki where proizv_id = 1;

-- ### Задание 2 - Все доступные датчики
select * from datchiki d
    left join ceny c on d.id = c.datchik_id
where c.nalichie = true;

-- ### Задание 3, 7, 9, 10, 11
create view discounts as select * from (
    select d.descr, p.descr as proizv, c.cena,
           cena - (cena * sum(pr.skidka) / 100) as cena_so_skidkoy,
           sum(pr.skidka) as skidka, group_concat(pr.descr) as akcia
    from datchiki d
        left join ceny c on d.id = c.datchik_id
        left join proizvoditel p on d.proizv_id = p.id
        left join datchiki_promo dp on d.id = dp.datchik_id
        left join promo pr on pr.id = dp.promo_id
    where cena < 3000
    group by d.id
    having cena_so_skidkoy < 2000
) q order by cena_so_skidkoy;

select * from discounts where cena < 2000;

-- drop view discounts;

-- ### Задание 4
select * from datchiki d, datchiki d2;

-- ### Задание 5

-- ### Задание 6
select * from datchiki where proizv_id = 2
union
select * from datchiki where proizv_id = 3;

select * from datchiki where proizv_id in (2, 3)
intersect
select * from datchiki where proizv_id in (2);

select * from datchiki where proizv_id in (2, 3)
except
select * from datchiki where proizv_id in (2);

-- ### Задание 8

-- ### Задание 12

select * from datchiki d where id in (
    select datchik_id from datchiki_promo dp
        left join promo p on dp.promo_id = p.id
    where skidka > 5 and dp.datchik_id = d.id);

select * from datchiki d where id in (
    select datchik_id from datchiki_promo dp
        left join promo p on dp.promo_id = p.id
    where skidka > 5 and dp.datchik_id = d.id);


-- ## Вставка данных

-- ### Добавляем в базу новую скидку
insert into promo (descr, skidka) value ('Супер акция!', 25);

-- ## Обновление данных

-- ### Изменяем название датчика
update datchiki set descr = 'Датчик угарного газа обычный' where id = 5;

-- Удаление данных

-- ### Удаляем производителя датчиков и связанный с ним ассортимент
start transaction;
    delete from datchiki_promo where datchik_id in (select id from datchiki where proizv_id = 3);
    delete from datchiki where proizv_id = 3;
    delete from proizvoditel where id = 3;
commit;

