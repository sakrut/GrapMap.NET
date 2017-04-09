USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Segment.csv" AS row
CREATE (:Segment {lineNo: toInt(row.lineNo) ,speedLimit: toInt(row.speedLimit),relationSort: toInt(row.relationSort) ,kmFrom :  toFloat(row.kmFrom),kmTo : toFloat(row.kmTo)});
 
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///point.csv" AS row
CREATE (:Point {name: row.nazwa   });



	
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Segment.csv" AS row
MATCH (sta:Segment {lineNo: toInt(row.lineNo),relationSort: toInt(row.relationSort)})
MATCH (stc:Segment {lineNo: sta.lineNo,relationSort: (sta.relationSort+1)})
MERGE (sta)-[:Continue]-(stc);




USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///pointLocation.csv" AS row
MATCH (p:Point {name: row.nazwa })
MATCH (stc:Segment {lineNo: toInt(row.nr_lini)})
Where toInt(row.km_os) >= toInt(stc.kmFrom) and (toInt(stc.kmTo) >  toInt(row.km_os) or toInt(row.km_os) = toInt(stc.kmTo))
MERGE (p)-[:Stay { km: toFloat(row.km_os),  lineNo: toInt(row.nr_lini) }]-(stc);









----
MATCH (s:Point)-[r:Stay]-(t:Segment)
where  r.lineNo = t.lineNo
with distinct s,r.km as km, t.lineNo as  lineNo
order by km 
with collect({s:s,km:km,lineNo:lineNo}) as one , collect({s:s,km:km,lineNo:lineNo}) as two
UNWIND one as ss 
with  ss  , filter(next IN two WHERE ss.lineNo = next.lineNo and next.km >= ss.km and NOT next.s.name = ss.s.name)[0] as nss
with  ss.s as fi,  nss.km-ss.km as distance , ss.lineNo as lineNo, nss.s as se
where se is not null
merge (fi)-[:Connect{distance: distance ,lineNo: lineNo}]-(se)

