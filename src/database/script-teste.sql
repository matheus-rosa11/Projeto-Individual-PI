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
    (null, 1, 1, '2022-06-07'),
    (null, 1, 2, '2022-06-07');

insert into venda VALUES
    (null, 3, 1, '2022-06-07'),
    (null, 1, 1, '2022-06-07'),
    (null, 2, 1, '2022-06-07');

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


