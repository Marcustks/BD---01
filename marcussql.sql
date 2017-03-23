
/* aqui a tabela de departamento */
create table DEPA (cdd char(1) primary key,dsd varchar(20)not null, natger int)
	insert into DEPA values('P','Produção',120)
	insert into DEPA values('v','vendas',140)
	
/* aqui a tabela de funcionarios */
create table FUNC(mat int primary key, nom char(5) not null ,sal int not null,
					sex char(1)check(sex ='M'or sex ='F'),
					cdd char(1) foreign key references DEPA,
					matChef int foreign key references Func(mat))
					
insert into func values(100,'zé', 900,'M','P',120)
insert into func values(110,'sa',1000,'M','P',120)
insert into func values(120,'lu',1100,'f','p',140)
insert into func values(130,'ED',1200,'M','v',140)
insert into func values(140,'JO',1300,'M','v',Null)

create table DEPE(mat int foreign key references func(mat),
seq int ,nomd varchar(20),primary key (mat,seq))

insert into DEPE values(100,01,'ZE jr')
insert into DEPE values(100,02,'ZE Filho')
insert into DEPE values(110,01,'SA jr')

/* update FUNC set matChef = null */

select * from FUNC
select * from DEPA
select * from DEPE
	
/* A exibir os funcuionarios em ordem de departamento e 
ordem descrecente de salario e em ordem alfabetica em caso de iqualdade de salario; */

select * from FUNC order by cdd , sal desc , nom asc  
  
/* B exibir para cada departamento:codifo,quantidade de funcuinarios , 
total de salarios , menor salario , media de salario , salario mais alto */

SELECT cdd ,count(*) ,MAX(sal)"maximo",MIN(sal)"minimo", SUM(sal)"soma", AVG(sal)"media"
FROM FUNC group by cdd;
-- group by ordernar e separar 

/*c exibir para cada departamento codigo quantidade de funcuinarios e total de salarios
apenas para os departamentos com mais de 1 funcuinario. */

select cdd , COUNT (*) ,
/*
begin tran
delete from DEPA where cdd = 'V'
rollback tran */ 