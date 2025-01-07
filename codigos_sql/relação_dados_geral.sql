SELECT 
    h.nome AS estado,
    h.periodo AS ano,
    h.valor AS homicidios,
    p.populacao,
    d.razao AS desigualdade,
    (h.valor::NUMERIC / p.populacao::NUMERIC) * 100000 AS taxa_homicidios
FROM 
    homicidios_estado h
JOIN 
    populacao_estado p
ON 
    h.nome = p.estado AND h.periodo = p.ano
JOIN 
    desigualdade d
ON 
    h.nome = d.territorialidade AND h.periodo = d.ano
ORDER BY 
    h.nome, h.periodo;
