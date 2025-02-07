#!/bin/sh

# This file was taken from https://github.com/olimorris/neotest-phpunit/issues/11#issuecomment-2208532710
# neotest-phpunit does not support running tests in docker and reflect the results in Neotest, this script
# does that.
#
# This script should be placed somewhere where it can be executed. The path of this file should be used in
# neotest-phpunit's phpunit_cmd option.
#
#
# phpunit_cmd = function()
#   return "/path/to/test.sh";
# end,
#
#

# Add the following environment variables to neotest-phpunit's config
containerName=$CONTAINER
phpunitPath=$REMOTE_PHPUNIT_BIN
projectPath=$LOCAL_PROJECT_PATH

localPhpUnitResultPath='/tmp/phpunit-result.xml'
argsInput=${@}

for i in $argsInput; do
    case $i in
        --log-junit=*)
            outputPath="${i#*=}"
            ;;
        *)
            ;;
    esac
done

# Detect path
container=$(docker ps -n=-1 --filter name=$containerName --format="{{.ID}}")
phpunitPath=$(docker exec -it $container /bin/bash -c "if [ -f vendor/bin/phpunit ]; then echo vendor/bin/phpunit; else echo bin/phpunit; fi" | tr -d '\r')
execPath=$(docker exec -it $container /bin/bash -c "if [ -f /bin/sh ]; then echo /bin/sh; else echo /bin/bash; fi" | tr -d '\r')
dockerPath=$(docker inspect --format {{.Config.WorkingDir}} $container)
containerFilePath=$(echo "${1}" | sed 's|/Users/ettdro/Documents/clearestate/clearestate-app/api|/var/www/html|g')
testFilter=${4}

# Run the tests
if [ -n "$test_filter" ]; then
  echo "docker exec -t $container php $phpunitPath --no-coverage --filter=\"$testFilter\" $containerFilePath --log-junit=${localPhpUnitResultPath}"
  docker exec -t $container php $phpunitPath --no-coverage --filter="$testFilter" $containerFilePath --log-junit=${localPhpUnitResultPath}
else
  echo "docker exec -t $container php $phpunitPath --no-coverage $containerFilePath --log-junit=${localPhpUnitResultPath}"
  docker exec -t $container php $phpunitPath --no-coverage $containerFilePath --log-junit=${localPhpUnitResultPath}
fi

docker cp -a "$container:$localPhpUnitResultPath" "$outputPath"|- &> /dev/null

# replace docker path to locals
sed -i '_' "s#$dockerPath#$projectPath#g" $outputPath
