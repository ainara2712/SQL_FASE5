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
select c.nom, count(*) as total_vols, durada as vol_promig, data as last_vol
from companyia c
join avio a on (c.nom = a.companyia)
join vol v on (a.num_serie = v.avio)
where c.pais LIKE '%Spain%' /* Falta que no tinguin avions ni cap vol*/
order by c.nom DESC;

select c.nom
from companyia c
join avio a on (c.nom = a.companyia)
where c.pais LIKE '%Spain%';

-- Pregunta 3
select 'No ho sé';

-- Pregunta 4
select 'No ho sé';

-- Pregunta 5
select 'No ho sé';