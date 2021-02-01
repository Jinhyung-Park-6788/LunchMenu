#!/bin/bash

REPOSITORY=/home/ec2-user/app/step2
PROJECT_NAME=freelec-springboot2-webservice

echo "> Copy Build File"
cp $REPOSITORY/zip/*.jar $REPOSITORY/

echo "> Check running process PID"
CURRENT_PID=$(pgrep -f1 freelec-springboot2-webservice | grep jar | awk '{print $1}')

echo "Now running process PID: $CURRENT_PID"

if [ -z "$CURRENT_PID" ]; then
  echo "> It doesn't exist running process."
else
  echo "> kill -15 $CURRENT_PID"
  kill  -15 $CURRENT_PID
  sleep 5
fi

echo "> Deploy New application"

JAR_NAME=$(ls -tr $REPOSITORY/*.jar | tail -n 1)

echo "> JAR name : $JAR_NAME"

echo "> $JAR_NAME add execution permission"

chmod +x $JAR_NAME

echo "> Execution JAR"

#nohup java -jar \
# -Dspring.config.location=classpath:/application.properties,classpath=:/application-real.properties,/home/ec2-user/app/application-oauth.properties,/home/ec2-user/app/application-real-db.properties \
# -Dspring.profiles.active=real \
# $JAR_NAME > $REPOSITORY/nohup.out 2>&1 &

nohup java -jar \
    -Dspring.config.location=classpath:/application.properties,classpath:/application-real.properties,/home/ec2-user/app/application-oauth.properties,/home/ec2-user/app/application-real-db.properties \
    -Dspring.profiles.active=real \
    $JAR_NAME > $REPOSITORY/nohup.out 2>&1 &