#!/usr/bin/python3

from string import Template
import configparser, sys
from datetime import date

values_dict = {}
today = date.today()
CHARTVER = sys.argv[1]

config = configparser.ConfigParser()
config.read('{}/extras/casa_values.ini'.format(CHARTVER))
for i in config['DEFAULT']:
    values_dict[i]=config['DEFAULT'][i]

print(values_dict)

with open('{}/extras/cluster-register-template.txt'.format(CHARTVER), encoding = 'utf-8') as fh:
    data = fh.readlines()[1:]

template_data = "".join(data)
subs_string = Template(template_data)
parsed=subs_string.safe_substitute(values_dict)

with open('{}/templates/cluster-register.yaml'.format(CHARTVER), "w") as fh:
    fh.writelines("# Manifest created on {}\n".format(today))
    fh.writelines("\n")
    fh.writelines(parsed)
