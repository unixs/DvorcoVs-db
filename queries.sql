create user student@'%' identified by 'studentPW';
create database project;
grant all privileges on project.* TO student@'%';
flush privileges;
