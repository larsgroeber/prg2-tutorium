use blatt_12;

CREATE TABLE `blatt_12`.`dvd`
(
    `ID`                INT          NOT NULL,
    `Titel`             VARCHAR(200) NULL,
    `ASIN`              VARCHAR(45)  NULL,
    `Zustand`           VARCHAR(45)  NULL,
    `FSKAltersfreigabe` INT          NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `blatt_12`.`kunde`
(
    `ID`      INT         NOT NULL,
    `Name`    VARCHAR(45) NULL,
    `Vorname` VARCHAR(45) NULL,
    `Geb`     DATE        NULL,
    PRIMARY KEY (`ID`)
);

CREATE TABLE `blatt_12`.`ausleihe`
(
    `DVDID`   INT  NOT NULL,
    `KundeID` INT  NOT NULL,
    `von`     DATE NOT NULL,
    `bis`     DATE NULL,
    PRIMARY KEY (`DVDID`, `KundeID`, `von`),
    FOREIGN KEY (DVDID) references dvd (ID),
    FOREIGN KEY (KundeID) references kunde (ID)
);



INSERT INTO `blatt_12`.`dvd` (`ID`, `Titel`, `ASIN`, `Zustand`, `FSKAltersfreigabe`)
VALUES ('4', 'Traumfabrik', 'B07SZBLFYZ', 'neu', '6');
INSERT INTO `blatt_12`.`dvd` (`ID`, `Titel`, `ASIN`, `Zustand`, `FSKAltersfreigabe`)
VALUES ('5', 'Men in Black: International', 'B07SYSGJR9', 'neu', '12');
INSERT INTO `blatt_12`.`dvd` (`ID`, `Titel`, `ASIN`, `Zustand`, `FSKAltersfreigabe`)
VALUES ('7', 'Godzilla II: King of the Monsters', 'B07S75L3N1', 'abgenutzt', '12');
INSERT INTO `blatt_12`.`dvd` (`ID`, `Titel`, `ASIN`, `Zustand`, `FSKAltersfreigabe`)
VALUES ('9', 'Traumfabrik', 'B07SZBLFYZ', 'abgenutzt', '6');

INSERT INTO `blatt_12`.`kunde` (`ID`, `Name`, `Vorname`, `Geb`)
VALUES ('15', 'Peter', 'Meier', '2010-01-01');
INSERT INTO `blatt_12`.`kunde` (`ID`, `Name`, `Vorname`, `Geb`)
VALUES ('18', 'Max', 'Müller', '2007-01-01');
INSERT INTO `blatt_12`.`kunde` (`ID`, `Name`, `Vorname`, `Geb`)
VALUES ('42', 'Max', 'Meier', '2008-01-01');
INSERT INTO `blatt_12`.`kunde` (`ID`, `Name`, `Vorname`, `Geb`)
VALUES ('58', 'Lara', 'Müller', '2011-02-24');

INSERT INTO `blatt_12`.`ausleihe` (`DVDID`, `KundeID`, `von`, `bis`)
VALUES ('4', '58', '2019-07-05', '2019-07-08');
INSERT INTO `blatt_12`.`ausleihe` (`DVDID`, `KundeID`, `von`, `bis`)
VALUES ('5', '18', '2019-04-12', '2019-05-02');
INSERT INTO `blatt_12`.`ausleihe` (`DVDID`, `KundeID`, `von`, `bis`)
VALUES ('4', '18', '2019-07-09', NULL);
INSERT INTO `blatt_12`.`ausleihe` (`DVDID`, `KundeID`, `von`, `bis`)
VALUES ('9', '15', '2019-07-06', NULL);


# 4)

## a)

select d.Zustand, count(d.Titel) as DVDs
from dvd as d
group by d.Zustand;

## b)

select d.Titel, count(d.ID) as Anzahl
from dvd as d
group by d.ASIN, d.Titel
having count(d.ID) > 1;
#2

## c)

select d.ID, d.Titel
from dvd as d
         join ausleihe a on d.ID = a.DVDID
         join kunde k on a.KundeID = k.ID
where k.ID = 18
  and a.bis is null;

## d)

select ID, Titel, FSKAltersfreigabe
from dvd
where FSKAltersfreigabe = (select max(FSKAltersfreigabe) from dvd);