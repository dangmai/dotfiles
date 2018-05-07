#!/usr/bin/env zsh

function import_sonarr () {
    originalPath="/mnt/main/Downloads/"
    replacementPath="/downloads/"
    finalPath=${1/$originalPath/$replacementPath}
    curl https://hs.dangmai.net/sonarr/api/Command -X POST -H "X-API-KEY: ${SONARR_API_KEY}" --user ${SONARR_USERNAME}:${SONARR_PASSWORD} -d '{"name": "DownloadedEpisodesScan", "path": "'"$finalPath"'"}'
}
