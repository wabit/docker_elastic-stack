docker-compose -f create-certs.yml run --rm create_certs
docker-compose -f elastic-docker-tls.yml up -d
docker exec es01 /bin/bash -c "bin/elasticsearch-setup-passwords auto --batch --url https://es01:9200" > password.txt
if ! command -v gsed &> /dev/null
then
    echo "gsed could not be found"
    echo "installing via brew"
    brew install gsed
fi
KIB_PASS=$(cat password.txt | grep "PASSWORD kibana_system" | cut -d "=" -f2 | sed 's/^ *//g')
gsed -i '/ELASTICSEARCH_PASSWORD/c\      ELASTICSEARCH_PASSWORD: '$KIB_PASS'' ./elastic-docker-tls.yml
docker-compose -f elastic-docker-tls.yml up -d
ES_USER_PASS=$(cat password.txt | grep "PASSWORD elastic" | cut -d "=" -f2 | sed 's/^ *//g')
echo "--------------------------------------------"
echo "Deployment Succesfull!"
echo " "
echo "log into Kibana here https://localhost:5601"
echo " "
echo "CREDENTIALS"
echo "-----------"
echo "Username: elastic"
echo "password" $ES_USER_PASS
echo " "
echo "more credentials can be found in password.txt"
