#!/bin/bash

FOLDER_ENV_TWILIO="env-conf"
if [ ! -d "$FOLDER_ENV_TWILIO" ]; then
	git clone https://github.com/channel40/env-conf.git
fi

cd env-conf
cat twilio_env.properties >> ../$1
