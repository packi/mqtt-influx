#!/bin/bash

mosquitto_sub -h $MQTT_SERVER -t $MQTT_TOPIC_FILTER -v | \
	while read line
		do
			sensorname=`echo $line | cut -d ' ' -f 1`
			json=`echo $line | cut -d ' ' -f 2`
			temperature=`echo $json | jq .temperature`
			humidity=`echo $json | jq .humidity`
			influx -host $INFLUX_HOST -database $INFLUX_DATABASE -username $INFLUX_USERNAME -execute "INSERT data,sensor=$sensorname temperature=$temperature,humidity=$humidity"
		done

