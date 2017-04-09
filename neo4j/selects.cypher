MATCH (s:Point),(e:Point),
p = shortestpath((s)-[*]-(e))
WHERE s.name = 'JASŁO' AND e.name = 'RZESZÓW'
return p





MATCH (s:Point{name:'JASŁO'}),(e:Point{name:'RZESZÓW'})
CALL apoc.algo.dijkstra(s, e, 'Connect', 'distance') YIELD path, weight
RETURN path, weight






MATCH (s:Point)-[c:Connect]-(t:Point)
where s.name <> 'Czudec' and t.name <> 'Czudec' 
merge (s)-[:Connect_tempWOCzud{distance: c.distance ,lineNo: c.lineNo}]-(t)