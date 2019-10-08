create table billrec(
bill_id int(10),
bill_type_code varchar(4),
bill_amnt float,
bill_due_date date,
bill_cycle_begin date,
bill_cycle_end date,
bill_pay_date date,
bill_cmmt varchar(100));

alter table billrec
add constraint billrec_pk
primary key(bill_id);

--
create table billtype(
bill_type_code varchar(4),
bill_type_desc varchar(100),
bill_freq_mon int(2),
bill_eff date,
bill_link varchar(100),
bill_user varchar(50),
bill_pswd varchar(50));

alter table billtype
add constraint billtype_pk
primary key(bill_type_code);

insert into billtype
values(
'wawa',
'water and waste - sacramento city',
1,
date(20150312),
null,
null,
null,
null);

insert into billtype
values(
'elec',
'elec - smud',
1,
date(20150312),
null,
'www.smud.org',
'jingjing2',
'2dingding');

insert into billtype
values(
'gasf',
'gas - PG&E',
1,
date(20150312),
null,
'www.pge.com',
'zhangp',
null);

insert into billtype
values(
'intp',
'internet peng - comcast',
1,
date(20150312),
null,
'www.comcast.com',
'pengzhang4855',
'BusyPast3');

insert into billtype
values(
'loan',
'loan - stonegate',
1,
date(20150312),
null,
'www.stonegatemtg.com',
'nanjiang1',
'workpassword');

insert into billtype
values(
'hoaf',
'HOA fee',
1,
date(20150312),
date(20150401),
'natomaspark.com',
null,
null);

insert into billtype
values(
'hmin',
'Home insurance - nationwide',
12,
date(20150312),
date(20150312),
'www.nationwide.com',
null,
null);

insert into billtype
values(
'autp',
'Auto insurance Peng- nationwide',
12,
date(20150312),
null,
'www.nationwide.com',
null,
null);

insert into billtype
values(
'autn',
'Auto insurance Nan- nationwide',
12,
date(20150312),
null,
'www.nationwide.com',
null,
null);

insert into billtype
values(
'autm',
'Auto insurance Mary- nationwide',
12,
date(20150312),
null,
'www.nationwide.com',
null,
null);

insert into billtype
values(
'flod',
'Flooding insurance - nationwide',
12,
date(20150312),
date(20150312),
'www.nationwide.com',
null,
null);
