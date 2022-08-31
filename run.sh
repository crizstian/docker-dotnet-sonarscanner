#!/bin/bash

set -x

PROJECT_KEY="${PROJECT_KEY:-ConsoleApplication1}"
SONAR_HOST="${HOST:-http://localhost:9000}"
SONAR_LOGIN_KEY="${LOGIN_KEY:-admin}"

mono /opt/sonar-scanner-msbuild/SonarScanner.MSBuild.exe begin /d:sonar.host.url=$SONAR_HOST /d:sonar.login=$SONAR_LOGIN_KEY /k:$PROJECT_KEY
dotnet build
mono /opt/sonar-scanner-msbuild/SonarScanner.MSBuild.exe end /d:sonar.login=$SONAR_LOGIN_KEY
