SELECT
    c.id AS id_clube,
    c.nome AS clube,

    COUNT(*) FILTER (
        WHERE r.colocacao = 1
    ) AS ouro,

    COUNT(*) FILTER (
        WHERE r.colocacao = 2
    ) AS prata,

    COUNT(*) FILTER (
        WHERE r.colocacao = 3
    ) AS bronze,

    COUNT(*) FILTER (
        WHERE r.colocacao BETWEEN 1 AND 3
    ) AS total_medalhas,

    COUNT(*) FILTER (
        WHERE r.colocacao BETWEEN 4 AND 8
    ) AS total_4_ao_8

FROM clube c

JOIN inscricao i
    ON i.id_clube = c.id

JOIN prova_campeonato pc
    ON pc.id_prova_campeonato = i.id_prova_campeonato

JOIN resultado r
    ON r.id_inscricao = i.id

WHERE pc.id_campeonato = 1
  AND r.status = 'OK'

GROUP BY c.id, c.nome

ORDER BY
    ouro DESC,
    prata DESC,
    bronze DESC;
