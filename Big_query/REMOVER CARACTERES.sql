---remover caracteres estranhos----

SELECT 
    REGEXP_REPLACE(track_name, r'[^a-zA-Z0-9\s]', '') AS trackname_limpa,
    REGEXP_REPLACE(artist_s__name, r'[^a-zA-Z0-9\s]', '') AS artistsname_limpa
FROM 
    `projeto-2-laboratoria-458815.laboratoria.track_in_spotify - spotify_cleaned_unique`;
