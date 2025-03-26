/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'aplicacions web.
    Mòdul: 0484 Bases de dades. 
    AUTORS: Ainara Juárez Moreno i Marcos Góngora Carriedo
    DATA: 20/03/2025
****************************************************** */

-- Pregunta 1
select a.ciutat, count(*) as total_vols
from vol v 
join aeroport a on (v.aeroport_desti = a.codi)
where v.data LIKE '%2023%'
group by a.ciutat
having total_vols >= 800
order by total_vols DESC;

-- Pregunta 2
select c.nom, count(codi) as total_vols, AVG(v.durada) as vol_promig, MAX(v.data) as last_vol
from companyia c
left join avio a on (c.nom = a.companyia)
left join vol v on (a.num_serie = v.avio)
where c.pais LIKE '%Spain%'
group by c.nom
order by c.nom;

-- Pregunta 3
select YEAR(v.data) as any, MONTH(v.data) as mes, c.nom , count(v.codi) as total_vols
from avio a
join vol v on (v.avio = a.num_serie)
join companyia c on (a.companyia = c.nom)
where v.data LIKE '%2023%'
and c.pais LIKE '%Spain%'
group by c.nom, any, mes
order by any, mes, c.nom;

-- Pregunta 4
select ao.codi as codi_origen, ao.nom as nom_origen, ao.pais as pais_origen, ad.nom as nom_desti, ad.pais as pais_desti
from vol v
join aeroport ao on (v.aeroport_origen = ao.codi)
join aeroport ad on (v.aeroport_desti = ad.codi)
where v.data = (
  select v.data
  from vol v
  where codi = 482739
)
and v.aeroport_desti = (
  select aeroport_desti
  from vol v
  where codi = 482739
)
and v.aeroport_origen = (
  select aeroport_origen
  from vol v
  where codi = 482739
)
and v.codi <> 482739;

-- Pregunta 5
select c.nom, count(v.codi) as total_vols
from avio a
join vol v on (v.avio = a.num_serie)
join companyia c on (a.companyia = c.nom)
group by c.nom
having total_vols > (
  select count(v.codi) as total_vols
  from avio a
  join vol v on (v.avio = a.num_serie)
  join companyia c on (a.companyia = c.nom)
  where c.nom LIKE '%British Airways%'
) 
order by total_vols;