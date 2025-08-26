if [ x${ELASTIC_PASSWORD} == x ]; then
  echo "Set the ELASTIC_PASSWORD environment variable in the .env file";
  exit 1;
elif [ x${KIBANA_PASSWORD} == x ]; then
  echo "Set the KIBANA_PASSWORD environment variable in the .env file";
  exit 1;
elif [ x${LOGSTASH_PASSWORD} == x ]; then
  echo "Set the LOGSTASH_PASSWORD environment variable in the .env file";
  exit 1;
fi;

echo "Setting file permissions"
find . -type d -exec chmod 750 \{\} \;;
find . -type f -exec chmod 640 \{\} \;;
echo "Waiting for Elasticsearch availability";
elastic_status_code=500
until [ $elastic_status_code -eq 200 ]; do
  elastic_status_code=$(curl --write-out '200' --silent --output /dev/null http://es01:9200)
  sleep 1
done
echo "All done!";