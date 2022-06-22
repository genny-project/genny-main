#!/usr/bin/env python

exceptions = ["elasticsearch"]

import yaml, os
from pathlib import Path

path = Path("")

# Get directory of genny-charts (stored in genny/genny-charts)
path = "/" + "/".join(str(path.parent.absolute()).split("/")[1:-1]) + "/genny-charts/values.yaml"

yaml_dict = None

with open(path, "r") as stream:
    try:
        yaml_dict = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)


for exception in exceptions:
    yaml_dict.pop(exception)

envs = {}

for configmapname in yaml_dict.keys():
    if "config" not in yaml_dict[configmapname]:
        continue
    configmap = yaml_dict[configmapname]["config"]
    for key in configmap.keys():
        envs[key] = configmap[key]

with open("genny.env", "w") as output:
    for env in envs.keys():
        print(f"{env}:{envs[env]}")
        output.write(env + "=" + str(envs[env]) + "\n")