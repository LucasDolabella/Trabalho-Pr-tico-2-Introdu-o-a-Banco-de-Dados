SELECT 
    h.nome AS estado,
    h.periodo AS ano,
    p.populacao,
    h.valor AS homicidios,
    d.razao AS desigualdade,
    (h.valor::NUMERIC / p.populacao::NUMERIC) * 100000 AS taxa_homicidios
FROM 
    homicidios_estado h
JOIN 
    populacao_estado p ON h.nome = p.estado AND h.periodo = p.ano
JOIN 
    desigualdade d ON h.nome = d.territorialidade AND h.periodo = d.ano
WHERE 
    h.nome IN ('PR', 'PE', 'RS', 'BA', 'SC', 'GO')
ORDER BY 
    CASE 
        WHEN h.nome = 'BA' THEN 1
        WHEN h.nome = 'RS' THEN 2
        WHEN h.nome = 'PE' THEN 3
        WHEN h.nome = 'PR' THEN 4
		WHEN h.nome = 'GO' THEN 5
		WHEN h.nome = 'SC' THEN 6
    END,
    h.periodo;
