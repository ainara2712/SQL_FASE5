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
select 'No ho sé';

-- Pregunta 3
select 'No ho sé';

-- Pregunta 4
select 'No ho sé';

-- Pregunta 5
select 'No ho sé';