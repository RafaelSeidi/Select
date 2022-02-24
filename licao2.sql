drop database if exists licao;
Create database licao;
use licao;
Create table Cliente(
Cod_Cliente int not null primary key,
Nome_Cliente varchar(200) not null,
Endereco_Cliente varchar(200) not null,
CPF varchar(11) not null) engine=InnoDB;

Create table Produto(
Cod_Produto int not null primary key,
Preco_Produto decimal(6,2) not null,
Data_validade_Produto date not null,
Nome_Produto varchar(100) not null) engine=InnoDB;

Create table Compra(
Cod_Compra int not null primary key,
Preco_Compra decimal(6,2) not null,
Data_Compra datetime not null,
Cod_Cliente int not null,
Cod_Produto int not null,
foreign key (Cod_Cliente) references Cliente (Cod_Cliente),
foreign key (Cod_Produto) references Produto (Cod_Produto)) engine=InnoDB;

insert into Cliente values (1, "Ana", "Rua das Tulipá", 11111111111),
                           (2, "Maria", "Rua das Tulipá", 22222222222),
                           (3, "Braga", "Rua das Tulipá", 33333333333),
                           (4, "Loro", "Rua das Tulipá", 44444444444),
                           (5, "José", "Rua das Tulipá", 55555555555),
                           (6, "Raul", "Rua das Tulipá", 66666666666),
                           (7, "Gil", "Rua das Tulipá", 77777777777),
                           (8, "Silvio", "Rua das Tulipá", 88888888888),
                           (9, "Santos", "Rua das Tulipá", 99999999999),
                           (10, "Faustão", "Rua das Tulipá", 12345678912);

insert into Produto values (1, 25.00, "2050-05-06", "Cadeira"),
						   (2, 5.00, "2021-06-06", "Pacote Cheetos"),
                           (3, 2500.00, "2100-05-06", "Carro"),
                           (4, 28.00, "2020-07-06", "Bacon"),
                           (5, 2.00, "3000-05-06", "Celular tijolão"),
                           (6, 10.00, "2022-05-06", "Estojo"),
                           (7, 30.00, "2021-07-06", "Papel higiênico"),
                           (8, 6.00, "2020-06-06", "Celular nokia"),
                           (9, 1.00, "2021-09-06", "Lápis"),
                           (10, 190.00, "2022-05-06", "Relógio");
                           
insert into Compra values (1, 25.00, "2020-05-06 15:50:10", 1, 1),
                          (2, 5.00, "2020-05-06 15:50:20", 2, 2),
                          (3, 2500.00, "2020-01-06 15:50:30", 3, 3),
                          (4, 2500.00, "2020-01-06 15:50:40", 4, 3),
                          (5, 2.00, "2020-04-06 15:50:50", 5, 5),
                          (6, 10.00, "2020-03-02 15:51:00", 6, 6),
                          (7, 30.00, "2020-03-01 15:51:10", 7, 7),
                          (8, 2.00, "2020-04-16 15:51:20", 8, 8),
                          (9, 1.00, "2020-05-06 15:51:30", 9, 9),
                          (10, 190.00, "2020-05-06 15:51:40", 10, 10);
                          
select * from Produto where Preco_Produto = (select max(Preco_Produto) from Produto);

select Nome_Produto, Data_Compra from Compra inner join Produto on Compra.Cod_Compra = Produto.Cod_Produto where MONTH(Data_Compra) = '01';

select * from Produto where Preco_Produto = (select min(Preco_Produto) from Produto);

select Nome_Cliente, Data_Compra from Cliente inner join Compra on Cliente.Cod_Cliente = Compra.Cod_Compra where Data_Compra between '2019-12-01' and '2020-03-02';

select Nome_Cliente, CPF, Preco_Compra from Cliente inner join Compra on Cliente.Cod_Cliente = Compra.Cod_Compra where Preco_Compra >= 1000;

select Nome_Cliente, Endereco_Cliente, Data_Compra, Nome_Produto from Compra inner join Cliente on Compra.Cod_Compra = Cliente.Cod_Cliente inner join Produto on Compra.Cod_Compra = Produto.Cod_Produto
 where MONTH(Data_Compra) = '04' and Produto.Nome_Produto like 'Celular%';