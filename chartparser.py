#!/usr/bin/env python
import yaml, os
from pathlib import Path

def parseEnvs(path, excludes):
    yaml_dict = None
    with open(path, "r") as stream:
        try:
            yaml_dict = yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)

    for exclude in excludes:
        yaml_dict.pop(exclude)

    envs = {}

    for configmapname in yaml_dict.keys():
        if "config" not in yaml_dict[configmapname]:
            continue
        configmap = yaml_dict[configmapname]["config"]
        for key in configmap.keys():
            envs[key] = configmap[key]

    return envs

# Get directory of genny-charts (stored in genny/genny-charts)
path = "/" + "/".join(str(Path("").parent.absolute()).split("/")[1:-1]) + "/genny-charts"
excludes = ["elasticsearch"]

envs = parseEnvs(path + "/values.yaml", excludes)
#localEnvs = parseEnvs(path + "/localValues.yaml", excludes)

with open("genny.env", "w") as output:
    for env in envs.keys():
        print(f"{env}={str(envs[env])}")
        output.write(env + "=" + str(envs[env]) + "\n")
