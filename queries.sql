-- # Запросы

-- ## Администрирование

-- ### Создание Базы и пользователя
create user student@'%' identified by 'studentPW';
create database project;
grant all privileges on project.* TO student@'%';
flush privileges;

-- ## Выборка данных

-- ### Все датчики
select * from datchiki;

-- ### Все доступные датчики
select * from datchiki d
    left join ceny c on d.id = c.datchik_id
where c.nalichie = true;

-- ### Дешевле 3000
select * from datchiki d
    left join ceny c on d.id = c.datchik_id
where c.cena < 3000;

-- ### Выборка для каталга с учётом скидок
select * from (
    select d.descr, p.descr as proizv, c.cena, cena - (cena * sum(pr.skidka) / 100) as cena_so_skidkoy, sum(pr.skidka) as skidka, group_concat(pr.descr) as akcia
    from datchiki d
        left join ceny c on d.id = c.datchik_id
        left join proizvoditel p on d.proizv_id = p.id
        left join datchiki_promo dp on d.id = dp.datchik_id
        left join promo pr on pr.id = dp.promo_id
    group by d.id
) q order by cena_so_skidkoy;

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

