insert into usuario VALUES
    (null, 'Matheus', 'matheus@email.com', 'matheus123', 0),
    (null, 'Alejandro', 'alejandro@email.com', 'alejandro123', 0),
    (null, 'Doulgas', 'doulgas@email.com', 'doulgas123', 0),
    (null, 'Eduardo', 'eduardo@email.com', 'eduardo123', 0);

insert into curso VALUES   
    (null, 'V1', 10.00),
    (null, 'V2', 10.00),
    (null, 'V3', 10.00),
    (null, 'C1', 10.00),
    (null, 'C2', 10.00),
    (null, 'C3', 10.00);

insert into produto VALUES
    (null, 'Violão Giannini', 'Violão muito foda', 250.00),
    (null, 'Violão Taylor', 'Violão muito foda', 25000.00),
    (null, 'Capotraste', 'Utilitário muito forte', 20.00),
    (null, 'Palhetas', 'Palhetas muito boas', 10.00),
    (null, 'Violão Crafter', 'Violão muito foda', 220.00),
    (null, 'Guitarra Fender', 'Guitarra muito foda', 250.00);

insert into matricula VALUES
    (1, 1, '2022-06-07'),
    (1, 2, '2022-06-07');

insert into venda VALUES
    (3, 1, '2022-06-07'),
    (1, 1, '2022-06-07'),
    (2, 1, '2022-06-07');

insert into venda values
    (1, 1, 2, 2, '2022-06-08'),
    (2, 1, 3, 1, '2022-06-08'),
    (3, 2, 1, 1, '2022-06-08'),
    (4, 1, 4, null, '2022-06-08'),
    (5, 1, null, 3, '2022-06-08'),
    (6, 1, 4, null, '2022-06-08'),
    (7, 1, null, 3, '2022-06-08');

select u.idUsuario, u.nomeUsuario, v.idVenda, v.fkUsuario fkUsuarioVenda, v.fkProduto, m.idMatricula, m.fkUsuario fkUsuarioMatricula, m.fkCurso, m.dtMatricula
    from usuario u
        join venda v
            on v.fkUsuario = u.idUsuario
                join matricula m
                    on m.fkUsuario = u.idUsuario
                        where u.idUsuario = 1;



select u.nomeUsuario, count(m.idMatricula) 'COUNT ID MATRICULA'
    from usuario u
        join matricula m
            on u.idUsuario = m.fkUsuario union
select u.nomeUsuario, count(v.idVenda) 'COUNT ID VENDA'
    from usuario u
        join venda v
            on u.idUsuario = v.fkUsuario;

select u.nomeUsuario, count(v.idVenda), count(m.idMatricula)
    from usuario u
        join venda v
            on v.fkUsuario = u.idUsuario
                join matricula m
                    on m.fkUsuario = u.idUsuario
                        where idUsuario = 1;

select count(idMatricula)
    from matricula
        where fkUsuario = 1;

select u.nomeUsuario, count(v.idVenda), count(m.idMatricula)
        join venda v
            on v.fkUsuario = u.idUsuario
                where count(v.idVenda) = (select(count(idVenda) from venda))
                    join matricula m
                        on m.fkUsuario = u.idUsuario
                            where count(v.idMatricula) = (select(count(idMatricula) from matricula))
                                where u.idUsuario = 1; 

select u.nomeUsuario,(v.fkUsuario), (m.fkUsuario)
    from usuario u
        left join venda v
            on v.fkUsuario = u.idUsuario
             left join matricula m
                    on m.fkUsuario = u.idUsuario
                        where u.idUsuario = 1;

select u.nomeUsuario, count(m.fkUsuario)
    from usuario u
                join matricula m
                    on m.fkUsuario = u.idUsuario
                        where u.idUsuario = 1; 

select count(fkUsuario)
    from venda;

select u.nomeUsuario, count(v.fkProduto), count(v.fkCurso)
    from venda v
        join usuario u
            on v.fkUsuario = u.idUsuario
                group by u.nomeUsuario;


select u.nomeUsuario, count(v.fkProduto)
    from venda v
        join usuario u
            on v.fkUsuario = u.idUsuario
                group by u.nomeUsuario;