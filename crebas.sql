/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  22/07/2019 16:28:17                      */
/*==============================================================*/


drop table if exists ARTISTE;

drop table if exists CATEGORIE;

drop table if exists CLIENT;

drop table if exists GENRE;

drop table if exists RESERVATION;

drop table if exists RESERVER;

drop table if exists SPECTACLE;

drop table if exists SPECTACLE_ARTISTE;

drop table if exists SPECTACLE_GENRE;

/*==============================================================*/
/* Table : ARTISTE                                              */
/*==============================================================*/
create table ARTISTE
(
   ID_ARTISTE           int not null auto_increment,
   NOM_ARTISTE          varchar(50) not null,
   PRENOM_ARTISTE       varchar(50) not null,
   ANNEE_NAISSANCE_ARTISTE int not null,
   NATIONALITE_ARTISTE  varchar(50),
   primary key (ID_ARTISTE)
);

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE
(
   ID_CATEGORIE         int not null auto_increment,
   NOM_CATEGORIE        varchar(50),
   TAUX_REDUCTION       decimal,
   primary key (ID_CATEGORIE)
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT
(
   ID_CLIENT            int not null auto_increment,
   ID_CATEGORIE         int not null,
   NOM_CLIENT           varchar(50) not null,
   PRENOM_CLIENT        varchar(50) not null,
   EMAIL_CLIENT         varchar(50) not null,
   IDENTIFIANT_CLIENT   varchar(50) not null,
   PWD_CLIENT           varchar(50) not null,
   QUESTION_SECRETE_CLIENT varchar(100) not null,
   REPONSE_SECRETE_CLIENT varchar(100) not null,
   TELEPHONE_CLIENT     varchar(50),
   primary key (ID_CLIENT)
);

/*==============================================================*/
/* Table : GENRE                                                */
/*==============================================================*/
create table GENRE
(
   ID_GENRE             int not null auto_increment,
   GENRE                text,
   primary key (ID_GENRE)
);

/*==============================================================*/
/* Table : RESERVATION                                          */
/*==============================================================*/
create table RESERVATION
(
   ID_RESERVATION       int not null auto_increment,
   DATE_RESERVATION     datetime not null,
   MAIL_CONFIRMATION    varchar(500) not null,
   ANNULATION_RESERVATION varchar(50),
   primary key (ID_RESERVATION)
);

/*==============================================================*/
/* Table : RESERVER                                             */
/*==============================================================*/
create table RESERVER
(
   ID_CLIENT            int not null,
   ID_SPECTACLE         int not null,
   ID_RESERVATION       int not null,
   primary key (ID_CLIENT, ID_SPECTACLE, ID_RESERVATION)
);

/*==============================================================*/
/* Table : SPECTACLE                                            */
/*==============================================================*/
create table SPECTACLE
(
   ID_SPECTACLE         int not null auto_increment,
   NOM_SPECTACLE        varchar(100) not null,
   DATE_DEBUT_SPECTACLE date not null,
   DATE_FIN_SPECTACLE   date not null,
   HEURE_SPECTACLE      time,
   primary key (ID_SPECTACLE)
);

/*==============================================================*/
/* Table : SPECTACLE_ARTISTE                                    */
/*==============================================================*/
create table SPECTACLE_ARTISTE
(
   ID_ARTISTE           int not null,
   ID_SPECTACLE         int not null,
   ROLE                 varchar(50) not null,
   primary key (ID_ARTISTE, ID_SPECTACLE)
);

/*==============================================================*/
/* Table : SPECTACLE_GENRE                                      */
/*==============================================================*/
create table SPECTACLE_GENRE
(
   ID_SPECTACLE         int not null,
   ID_GENRE             int not null,
   primary key (ID_SPECTACLE, ID_GENRE)
);

alter table CLIENT add constraint FK_CLIENT_CATEGORIE foreign key (ID_CATEGORIE)
      references CATEGORIE (ID_CATEGORIE) on delete restrict on update restrict;

alter table RESERVER add constraint FK_RESERVER foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT) on delete restrict on update restrict;

alter table RESERVER add constraint FK_RESERVER foreign key (ID_RESERVATION)
      references RESERVATION (ID_RESERVATION) on delete restrict on update restrict;

alter table RESERVER add constraint FK_RESERVER foreign key (ID_SPECTACLE)
      references SPECTACLE (ID_SPECTACLE) on delete restrict on update restrict;

alter table SPECTACLE_ARTISTE add constraint FK_SPECTACLE_ARTISTE foreign key (ID_ARTISTE)
      references ARTISTE (ID_ARTISTE) on delete restrict on update restrict;

alter table SPECTACLE_ARTISTE add constraint FK_SPECTACLE_ARTISTE foreign key (ID_SPECTACLE)
      references SPECTACLE (ID_SPECTACLE) on delete restrict on update restrict;

alter table SPECTACLE_GENRE add constraint FK_FK_SPECTACLE_GENRE foreign key (ID_SPECTACLE)
      references SPECTACLE (ID_SPECTACLE) on delete restrict on update restrict;

alter table SPECTACLE_GENRE add constraint FK_FK_SPECTACLE_GENRE2 foreign key (ID_GENRE)
      references GENRE (ID_GENRE) on delete restrict on update restrict;

