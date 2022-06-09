insert into usuario VALUES
    (null, 'Matheus', 'matheus@email.com', 'matheus123'),
    (null, 'Alejandro', 'alejandro@email.com', 'alejandro123'),
    (null, 'Doulgas', 'doulgas@email.com', 'doulgas123'),
    (null, 'Eduardo', 'eduardo@email.com', 'eduardo123');


insert into produto(nomeProduto, descricao, preco) VALUES
    ('Combo de Utilitários', 'Diversos produtos úteis para você tocar suas músicas!', 100.00),
    ('Amplificador Borne', 'Ótimo amplificador para detonar nos solos!', 350.00),
    ("Palhetas D'Addario", 'Combo de palhetas de diversas cores, para todos os gostos!', 15.00),
    ("Cordas D'Addario", 'Uma das melhores cordas para violão do mercado!', 40.00),
    ('Cordas Elixir', 'A melhor corda de violão dos últimos tempos.', 120.00),
    ('Combo Músico Completo', 'Um combo com vioão, capa e palhetas para formar um músico completo!', 550.00),
    ('Suporte para violão e guitarra', 'Suporte de parede para guardar seu violão/guitarra!', 150.00),
    ('Palheta Flow .60mm', 'Uma ótima palheta para um melhor desempenho nos seus solos!', 3.00),
    ('Pedal Fender', 'O melhor produto para quem quer ser criativo com suas músicas! Loop Pedal Fender', 720.00),
    ('Suporte para violão e guitarra', 'Suporte de chão para guardar seu violão/guitarra!', 170.00);

insert into venda (fkUsuario, fkProduto) VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (1, 2),
    (1, 3),
    (3, 3),
    (3, 2),
    (4, 1);

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

-- AQUI TA FUNCIONANDO

select count(v.fkUsuario) 'Qtd. de compras', u.nomeUsuario
    from venda v
        join usuario u
            on v.fkUsuario = u.idUsuario
                group by u.nomeUsuario;

-- SELECT MUITO FODA >>>>

select v.dtVenda 'Data da venda', p.preco 'Valor da venda', u.nomeUsuario 'Comprador'
    from venda v
        join produto p
            on v.fkProduto = p.idProduto
                right join usuario u
                    on v.fkUsuario = u.idUsuario
                        where u.idUsuario = 5
                            group by u.nomeUsuario;