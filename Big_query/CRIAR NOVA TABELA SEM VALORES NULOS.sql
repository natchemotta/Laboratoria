----CRIAR NOVA TABELA SEM VALORES NULOS-----
CREATE TABLE `projeto-2-laboratoria-458815.laboratoria.track_in_competition_cleaned` AS
SELECT *
FROM `projeto-2-laboratoria-458815.laboratoria.track_in_competition - competition`
WHERE 
    track_id IS NOT NULL AND
    in_apple_playlists IS NOT NULL AND
    in_apple_charts IS NOT NULL AND
    in_deezer_playlists IS NOT NULL AND
    in_deezer_charts IS NOT NULL AND
    in_shazam_charts IS NOT NULL;
