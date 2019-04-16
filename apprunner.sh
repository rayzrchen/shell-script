#!/usr/bin/env bash

export JAVA_HOME="/c/Program Files/Java/jdk-11.0.2"
export ENCRYPTION_KEY=1234
cd /c/sandbox/tools
java -Xmx512m -cp h2-1.4.197.jar org.h2.tools.Server -tcp -web -baseDir "/c/sandbox/h2-db"