---LIMPAR VALORES DUPLICADOS---

SELECT 
    track_name, 
    artist_s__name, 
    COUNT(*) AS quantidade
FROM `projeto-2-laboratoria-458815.laboratoria.track_in_spotify - spotify_cleaned`
GROUP BY track_name, artist_s__name
HAVING COUNT(*) > 1;
