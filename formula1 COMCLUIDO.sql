create database formula1_db;
use formula1_db;

create table paises(
sigla varchar(3) primary key,
nome varchar(100) not null,
bandeira varchar(255),
hino varchar(255)
)engine=InnoDB default charset=utf8;

create table equipes(
id int primary key auto_increment,
nome varchar(100),
escudo varchar(255),
id_pais varchar(3),
foreign key(id_pais) references paises(sigla)
)engine=InnoDB default charset=utf8;

create table pilotos(
id int not null primary key auto_increment,
nome varchar(255),
altura decimal(3,2),
peso decimal (5,2),
nascimento date,
id_pais varchar(3), 
id_equipe int,
foreign key (id_pais) references paises(sigla),
foreign key (id_equipe) references equipes(id)
)engine=InnoDB default charset=utf8;

create table circuitos(

id int primary key auto_increment,
descricao varchar(255),
id_pais varchar(3),
foreign key (id_pais) references paises(sigla)
)engine=InnoDB default charset=utf8;

create table corridas(
id int primary key auto_increment,
descricao varchar(255), 
id_pais varchar(3),
foreign key(id_pais) references paises(sigla)
) engine=InnoDB default charset=utf8;

create table piloto_corridas(

id_piloto int,
id_corrida int,
dt_corrida date,
posicao int, 
pontos int, 
tempo varchar(100), 
primary key(id_piloto, id_corrida), 
foreign key (id_piloto) references pilotos(id),
foreign key (id_corrida) references corridas(id)
) engine=InnoDB default charset=utf8;


insert into paises(sigla, nome, bandeira, hino) values
('BRA','Brasil','https://images.emojiterra.com/twitter/v11/128px/1f1e7-1f1f7.png','//www.youtube.com/embed/Z7pFwsX6UVc'),
('ALE','Alemanha','https://images.emojiterra.com/twitter/v11/128px/1f1e9-1f1ea.png','//www.youtube.com/embed/-Atv5j-BjlI'),
('ENG','Inglaterra','https://images.emojiterra.com/twitter/v11/128px/1f3f4-e0067-e0062-e0065-e006e-e0067-e007f.png','//www.youtube.com/embed/xianOAFljbs'),
('ITA','Italia','https://images.emojiterra.com/twitter/v11/128px/1f1ee-1f1f9.png','//www.youtube.com/embed/_4FcMzjqYUw'),
('FIN','Finlandia','https://images.emojiterra.com/twitter/v11/512px/1f1eb-1f1ee.png','//www.youtube.com/embed/EQAD3ktkJLs'),
('AUS','Australia','https://images.emojiterra.com/twitter/v11/128px/1f1e6-1f1fa.png','//www.youtube.com/embed/tJbkNt5N4nY'),
('VEN','Venezuela','https://www.escudosfc.com.br/images/renault.png','//www.youtube.com/embed/edq5w4T-40s'),
('FRA','Franca','https://images.emojiterra.com/twitter/v11/128px/1f1e9-1f1ea.png','//www.youtube.com/embed/-Atv5j-BjlI'),
('SPN','Espanha','https://images.emojiterra.com/google/android-oreo/128px/1f1ea-1f1f8.png','//www.youtube.com/embed/C6Op3LmG9ng'),
('RU','Reino Unido','https://images.emojiterra.com/twitter/v11/512px/1f1f3-1f1f1.png','//www.youtube.com/embed/D8xGIVUVgP8');

insert into equipes (nome, escudo,id_pais) values
('MCLAREN MP4-5B','https://www.escudosfc.com.br/images/mclaren_logo_new.png','RU'),
('FW41','https://www.escudosfc.com.br/images/ferrari.png','ITA'),
('W08', 'https://www.escudosfc.com.br/images/mercedes_f1.png','ALE'),
('rb14','https://www.escudosfc.com.br/images/red_bull_logo.jpg','AUS'),
('W09', 'https://www.escudosfc.com.br/images/mercedes_f1.png','ALE'),
('rb13','https://www.escudosfc.com.br/images/red_bull_logo.jpg','AUS'),
('rs17','https://www.escudosfc.com.br/images/renault.png','FRA'),
('rs16','https://www.escudosfc.com.br/images/renault.png','FRA'),
('mclaren mp4-4','https://www.escudosfc.com.br/images/mclaren_logo_new.png','RU'),
('rb13','https://www.escudosfc.com.br/images/red_bull_logo.jpg','RU');

insert into pilotos (nome, altura, peso, nascimento,id_pais, id_equipe) values
('Felipe Massa', 1.66, 59,'1981-03-25','BRA',1),
('Michael Schumacher', 1.75, 75,'1969-01-03','ALE',2),
('Lawis Hamilton', 1.74, 71,'1985-01-09','ENG',3),
('Antonio Giovinazzi', 1.72, 70,'1993-12-14','ITA',4),
('Valtteri Bottas', 1.73, 70,'1989-08-28','FIN',5),
('Daniel Ricciardo', 1.78, 68,'1989-07-01','AUS',6),
('Pastor Maldonado', 1.73, 66,'1985-03-09','VEN',7),
('Nico Hulkenberg', 1.84, 70,'1987-08-19','FRA',8),
('Fernando Alonso', 1.71, 68,'1981-07-29','SPN',9),
('Max Verstappen', 1.80, 67,'1997-09-30','RU',10);	

insert into circuitos (id, descricao, id_pais) values
('1','Autódromo de Interlagos',1),
('2','Hockenheformula1_dbimring',2),
('3','Circuito de Silverstone',3),
('4','Autódromo Nacional de Monza',4),
('5','Circuito de Albert Park',5),
('6','Circuito Urbano de Marina Bay',6),
('7','Autódromo Nacional de Monza',7),
('9','Hungaroring',8),
('9','Circuito de Barcelona-Catalunha',9),
('10','Circuito de Spa-Francorchamps',10);

insert into corridas values
('1','GP DO BRASIL',1),
('2','GP DA ALEMANHA',2),
('3','GP DA GRÃ BRETANHA',3),
('4','GP DA AUSTRALIA',4),
('5','GP DA SINGAPURA',5),
('6','GP DA ITALIA',6),
('7','GP DA HUGRIA',7),
('8','GP DA ESPANHA',8),
('9','GP DA BELGICA',9);

insert into piloto_corridas values
(1,1,'2018-07-01',10,1,'mais uma volta'),
(2,2,'2018-09-15',4,12,'+51.930s'),
(3,3,'2018-07-08',3,15,'+39.945ss'),
(4,4,'2017-10-12',9,2,'mais uma voltas'),
(5,5,'2018-09-02',5,10,'+53.001s'),	
(6,6,'2018-09-16',6,8,'+53.982s'),
(7,7,'2018-07-29',7,6,'+103.011s'),
(8,8,'2018-03-20',8,4,'mais uma volta'),
(9,9,'2018-09-16',2,18,'+8.961s'),	
(10,10,'2018-09-02',1,25,'1:51:11.611');

























