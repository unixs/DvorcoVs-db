-- # Запросы

-- ## Выборка данных


-- ### Задание 1. Датчики одного производителя
select * from datchiki where proizv_id = 1;


-- ### Задание 2. Датчики в наличии
select * from datchiki d, ceny c
    where d.id = c.datchik_id
        and c.nalichie = true;


-- ### Задание 3. Расширенный запрос датчиков в наличии
select * from datchiki d, ceny c, proizvoditel p
    where d.id = c.datchik_id
        and d.proizv_id = p.id
        and c.nalichie = true;


-- ### Задание 4
select * from datchiki d, datchiki d2;


-- ### Задание 5

-- 5.1) Датчики со скидкой больше 10
select * from datchiki where id in (
    select c.datchik_id from ceny c
        left join datchiki_promo dp on c.datchik_id = dp.datchik_id
        left join promo p on dp.promo_id = p.id
    where skidka > 10
    );

-- 5.2) Датчики для которых предусмотрены акционые предложения
select * from datchiki d where exists (
    select * from ceny c
        left join datchiki_promo dp on c.datchik_id = dp.datchik_id
        left join promo p on dp.promo_id = p.id
    where d.id = dp.datchik_id
    );

-- 5.3) Датчики цена которых меньше цены всех датчиков со скидкой больше 10
select * from datchiki d
    left join ceny c on d.id = c.datchik_id
where c.cena < ALL (
    select c2.cena from datchiki d2
        left join ceny c2 on c2.datchik_id = d2.id
        left join datchiki_promo dp on d2.id = dp.datchik_id
        left join promo p on dp.promo_id = p.id
    where p.skidka > 10
);

-- 5.4) Датчики цена которых больше любого датчика со скидкой больше 10
select * from datchiki d
    left join ceny c on d.id = c.datchik_id
where c.cena > ANY (
    select c2.cena from datchiki d2
        left join ceny c2 on c2.datchik_id = d2.id
        left join datchiki_promo dp on d2.id = dp.datchik_id
        left join promo p on dp.promo_id = p.id
    where p.skidka > 10
);

-- 5.5) Производители для которых есть датчики со скидкой

select * from proizvoditel p
    where exists (
        select * from datchiki d
            inner join datchiki_promo dp on dp.datchik_id = d.id
            left join promo pr on pr.id = dp.promo_id
        where p.id = d.proizv_id
        );

-- 5.6) Производители для которых есть датчики со скидкой

select * from proizvoditel p
    where id in (
        select d.id from datchiki d
            inner join datchiki_promo dp on dp.datchik_id = d.id
            left join promo pr on pr.id = dp.promo_id
        where p.id = d.proizv_id
        );

-- 5.7) Производители для которых датчики стоят не более 4000

select * from proizvoditel p
    where 4000 >= all (
        select cena from ceny c
            inner join datchiki d on d.id = c.datchik_id
        where d.proizv_id = p.id
        );

-- 5.8) Производители для которых есть датчики ценой не более 4000

select * from proizvoditel p
    where 4000 >= any (
        select cena from ceny c
            inner join datchiki d on d.id = c.datchik_id
        where d.proizv_id = p.id
        );


-- ### Задание 6

-- 6.1) Датчики двух избранных производителей
select * from datchiki where proizv_id = 2
union
select * from datchiki where proizv_id = 3;

-- 6.2) Датчики производителя фигурирующего во всех группах
select * from datchiki where proizv_id in (2, 3)
intersect
select * from datchiki where proizv_id in (2);

-- 6.3) Датчики неупомянутого хотя бы в одной группе производителя
select * from datchiki where proizv_id in (2, 3)
except
select * from datchiki where proizv_id in (2);


-- ### Задание 7, 9, 10, 11
-- Представление датчиков с расчётом цены меньше  3000 и с учётом скидки Б 2000
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


-- ### Задание 8

-- 8.1) Датчики с ценами
select * from datchiki d
    join ceny c on d.id = c.datchik_id;

-- 8.2)
select * from datchiki d
    cross join datchiki d2;

-- 8.3)
-- MariaDB is not support NATURAL JOIN without (LEFT|RIGHT) direction

-- 8.4) Датчики с ценами
select * from datchiki d
    left outer join ceny c on d.id = c.datchik_id;

-- 8.5)
select * from datchiki
    natural left outer join ceny_log;

-- 8.6) Датчики с изменением цены
select * from datchiki
    natural right outer join ceny_log;


-- ### Задание 12

-- 12.1) Датчики со скидкой больше 5
select * from datchiki d where id in (
    select datchik_id from datchiki_promo dp
        left join promo p on dp.promo_id = p.id
    where skidka > 5 and dp.datchik_id = d.id);

-- 12.2) Датчики со скидкой меньше или равной 5
select * from datchiki d where id not in (
    select datchik_id from datchiki_promo dp
        left join promo p on dp.promo_id = p.id
    where skidka > 5 and dp.datchik_id = d.id);


-- ## Триггеры


-- ### Задание 13

create trigger if not exists task_13
    before update on proizvoditel
for each row
    update datchiki set proizv_id = NEW.id where proizv_id = OLD.id;


-- ### Задание 14

delimiter //
create trigger if not exists task_14
    before update on ceny
for each row
begin
    if OLD.cena != NEW.cena then
        insert into ceny_log (datchik_id, old_cena, new_cena) values (OLD.datchik_id, OLD.cena, NEW.cena);
    end if;
end; //
delimiter ;


-- ## Задание 15

-- MariaDB is not support WHEN keyword in CREATE TRIGGER statement
