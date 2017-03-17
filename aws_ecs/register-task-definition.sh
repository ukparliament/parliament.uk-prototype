#! /usr/bin/env bash

APP_NAME=$1

TMPFILE=$(mktemp)
aws ecs describe-task-definition --task-definition $APP_NAME | jq "{ containerDefinitions: .taskDefinition.containerDefinitions, family: .taskDefinition.family }" > $TMPFILE
aws ecs register-task-definition --cli-input-json file://$TMPFILE
rm $TMPFILE

