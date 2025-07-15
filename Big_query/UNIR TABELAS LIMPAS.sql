---unir tabelas limpas-----

SELECT DISTINCT
  A.track_id, 
  A.trackname_limpa, 
  A.artistsname_limpa,
  COALESCE(B.artist_count, 0) AS artist_count,
  COALESCE(B.released_year, 0) AS released_year,
  COALESCE(B.released_month, 0) AS released_month,
  COALESCE(B.released_day, 0) AS released_day,
  COALESCE(B.in_spotify_playlists, 0) AS in_spotify_playlists,
  COALESCE(B.in_spotify_charts, 0) AS in_spotify_charts,
  COALESCE(SAFE_CAST(B.streams AS INT64), 0) AS streams, -- SAFE_CAST para evitar erros
  COALESCE(C.bpm, 0) AS bpm,
  COALESCE(C.`key`, "ERRO") AS `key`,
  COALESCE(C.mode, "ERRO") AS mode,
  COALESCE(C.`danceability_%`, 0) AS `danceability_%`,
  COALESCE(C.`valence_%`, 0) AS `valence_%`,
  COALESCE(C.`energy_%`, 0) AS `energy_%`,
  COALESCE(C.`acousticness_%`, 0) AS `acousticness_%`,
  COALESCE(C.`instrumentalness_%`, 0) AS `instrumentalness_%`,
  COALESCE(C.`liveness_%`, 0) AS `liveness_%`,
  COALESCE(C.`speechiness_%`, 0) AS `speechiness_%`,
  COALESCE(D.in_apple_charts, 0) AS in_apple_charts,
  COALESCE(D.in_apple_playlists, 0) AS in_apple_playlists,
  COALESCE(D.in_deezer_charts, 0) AS in_deezer_charts,
  COALESCE(D.in_deezer_playlists, 0) AS in_deezer_playlists,
  COALESCE(D.in_shazam_charts, 0) AS in_shazam_charts,
  ---MAX(SAFE_CAST(B.streams AS INT64)) OVER () AS max_streams, -- SAFE_CAST aplicado ao MAX
  ---AVG(C.bpm) OVER () AS avg_bpm -- Média de bpm
FROM 
  `projeto-2-laboratoria-458815.laboratoria.trabalhar nessa aqui` AS A
LEFT JOIN 
  `projeto-2-laboratoria-458815.laboratoria.track_in_spotify - spotify_cleaned_unique` AS B
ON 
  A.track_id = B.track_id
LEFT JOIN 
  `projeto-2-laboratoria-458815.laboratoria.track_technical_info - technical_info_cleaned` AS C
ON 
  A.track_id = C.track_id
LEFT JOIN
  `projeto-2-laboratoria-458815.laboratoria.track_in_competition_cleaned` AS D
ON
  A.track_id = D.track_id
-- WHERE A.trackname_limpa LIKE '%love%' -- LIKE para filtrar músicas (desativado)
--   AND REGEXP_CONTAINS(CAST(B.released_year AS STRING), r'^202[0-9]$') -- REGEXP_CONTAINS para anos na década de 2020 (desativado)