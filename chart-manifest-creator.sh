#!/bin/bash

set -e

RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
COL='\033[1;33m'
NC='\033[0m' # No Color

: '
1. This script enables developer/devops engineer to create the chart manifest from its template. No end user should try this.
2. It consumes the chart version, substituion.py script, cluster-register-template.txt file and casa-values.ini file to create the cluster-register.yaml for the chart.
3. Developer/Devops engineer needs to update the cluster-register-template.txt and casa-values.ini file with the required values to create a cluster-register.yaml manifest for teh chart.
'

function usage()
{
    echo ""
    echo -e "${COL}Usage${NC}: ${GREEN}bash chart-manifest-creator.sh <Chart version>${NC}"
    echo -e "${YELLOW}Example: ${NC}bash chart-manifest-creator.sh v2.0.1${NC}"
    echo ""
    echo -e "${GREEN}Note: ${NC}Supported only for chart version >= v2.0.1${NC}"
    echo ""
}

while getopts ":h" option; do
   case $option in
      h) # display Help
         usage
	 exit;;
     \?) # incorrect option
	 echo "Error: Invalid option, check the below usage instruction"
	 usage
	 exit;;
   esac
done

if [ $# -eq 0 ]; then
    echo -e "${RED}No Chart version provided, need to provide chart version as argument${NC}"
    usage
    exit 1
fi

CHARTVER=$1
echo $CHARTVER
echo -e "Creating Helmchart manifests"
python3 substitution.py $CHARTVER
ls $CHARTVER/templates/cluster-register.yaml
if [[ $? == 0 ]]; then
	echo -e "Helmchart manifest created successfully"
else
	echo -e "Issue in Helmchart manifest creation"
fi
