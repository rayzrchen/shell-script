#!/usr/bin/env bash

export ENCRYPTION_KEY=123
SAND_BOX_FOLDER="/c/sandbox/h2-backup"

H2_JAR_FILE="h2-1.4.197.jar"
URL="jdbc:h2:tcp://localhost:9092/"

timestamp() {
  date +"%Y%m%d-%H%M%S"
}
cd /c/sandbox/tools

for filename in /c/sandbox/h2-db/*.mv.db; do
    NEW_NAME=$(basename "$filename" .mv.db)
    BACKUP_FILE=$SAND_BOX_FOLDER"/${NEW_NAME}-$(timestamp).deflate"
    BACKUP_URL=${URL}${NEW_NAME}
    java -Xmx512m -cp $H2_JAR_FILE org.h2.tools.RunScript -url $BACKUP_URL -user sa -password $ENCRYPTION_KEY -script $BACKUP_FILE -options compression deflate cipher aes password $ENCRYPTION_KEY
done