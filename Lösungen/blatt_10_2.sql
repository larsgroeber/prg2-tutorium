drop database blatt_10;
create database blatt_10;
use blatt_10;

create table veranstaltung
(
    nr       int auto_increment,
    semester enum ('SS','WS'),
    primary key (nr, semester)
);

create table bachelorarbeit
(
    title          varchar(255) primary key,
    anmeldeDatum   date not null,
    rueckgabeDatum date
);

create table student
(
    matrikelnummer varchar(255) primary key,
    vName          varchar(255) not null,
    nName          varchar(255) not null,
    ba_1           varchar(255),
    ba_2           varchar(255),
    ba_3           varchar(255),
    foreign key (ba_1) references bachelorarbeit (title),
    foreign key (ba_2) references bachelorarbeit (title),
    foreign key (ba_3) references bachelorarbeit (title)
);

create table belegt
(
    matrikelnummer varchar(255),
    nr             int,
    semester       enum ('SS', 'WS'),
    primary key (matrikelnummer, nr, semester),
    foreign key (matrikelnummer) references student (matrikelnummer),
    foreign key (nr, semester) references veranstaltung (nr, semester)
);

create table termin
(
    id    int primary key auto_increment,
    tag   enum ('mo', 'tu', 'we', 'th', 'fr', 'sa', 'so') not null,
    start time                                            not null,
    raum  varchar(255)                                    not null,
    dauer time                                            not null,
    va_1  int,
    sem_1 enum ('SS', 'WS'),
    va_2  int,
    sem_2 enum ('SS', 'WS'),
    foreign key (va_1, sem_1) references veranstaltung (nr, semester),
    foreign key (va_2, sem_2) references veranstaltung (nr, semester)
);

create table forschungsprojekt
(
    nr       int,
    semester enum ('SS', 'WS'),
    primary key (nr, semester),
    foreign key (nr, semester) references veranstaltung (nr, semester)
);

create table vorlesung
(
    nr         int,
    semester   enum ('SS', 'WS'),
    uebungsSws int unsigned not null,
    primary key (nr, semester),
    foreign key (nr, semester) references veranstaltung (nr, semester)
);

create table seminar
(
    nr       int,
    semester enum ('SS', 'WS'),
    maxTeiln int unsigned not null,
    primary key (nr, semester),
    foreign key (nr, semester) references veranstaltung (nr, semester)
);

### b) ###

insert into student (matrikelnummer, vName, nName)
values ('matrikel', 'Lars', 'Gröber');

insert into veranstaltung (semester)
values ('SS');
insert into veranstaltung (semester)
values ('SS');
insert into veranstaltung (semester)
values ('SS');

insert into termin (tag, start, raum, dauer, va_1, sem_1)
values ('mo', '12:00', 'R1', '1:30', 1, 'SS');
insert into termin (tag, start, raum, dauer, va_1, sem_1)
values ('tu', '14:00', 'R2', '1:30', 2, 'SS');
insert into termin (tag, start, raum, dauer, va_1, sem_1)
values ('mo', '11:00', 'R3', '1:30', 1, 'SS');
insert into termin (tag, start, raum, dauer, va_1, sem_1)
values ('mo', '13:00', 'R4', '1:30', 1, 'SS');

insert into belegt (matrikelnummer, nr, semester)
values ('matrikel', 1, 'SS');
insert into belegt (matrikelnummer, nr, semester)
values ('matrikel', 2, 'SS');


### c) ###


select t.tag, t.start, t.raum, v.nr
from termin as t
         join veranstaltung v on t.va_1 = v.nr and t.sem_1 = v.semester
         join belegt b on v.nr = b.nr and v.semester = b.semester
         join student s on b.matrikelnummer = s.matrikelnummer
where s.matrikelnummer = 'matrikel'
order by t.tag, t.start;


### d) ###

create view my_termin as
select t.id, t.tag, t.start, t.raum, v.nr, t.dauer
from termin as t
         join veranstaltung v on t.va_1 = v.nr and t.sem_1 = v.semester
         join belegt b on v.nr = b.nr and v.semester = b.semester
         join student s on b.matrikelnummer = s.matrikelnummer
where s.matrikelnummer = 'matrikel'
order by t.tag, t.start;


select distinct t.tag, t.start, t.raum, t.dauer, t.nr
from my_termin t,
     my_termin t2
where t.id != t2.id
  and t.tag = t2.tag
  and (
        (t.start between t2.start and t2.start + t2.dauer)
        or (t2.start between t.start and t.start + t.dauer)
    )
order by t.tag, t.start;


