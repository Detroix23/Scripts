#!/bin/bash

name="${1}"
path="${2}"

sys_user="${USER}"
user="detroix23"
model="/home/${sys_user}/scripts/py-model"


# Argument check.
if [ -z "${path}" ]; then
	path="."
fi

if [ -z "${name}" ]; then
	echo "(X) - No name ${name}"
	exit 1;
elif [ -d "${path}/${name}" ]; then
	echo "(X) - Directory already exists (${path}/${name})."
	exit 1;
fi

full="${path}/${name}"

# Setup.
echo "Initializing a Python project (${path})."

mkdir "${full}" 

mkdir "${full}/src"
cp -r "${model}/src/main/" "${full}/src/${name}_${user}"
cp "${model}/.gitignore" "${full}/.gitignore"
cp "${model}/pyproject.toml" "${full}/pyproject.toml"
cp "${model}/README.md" "${full}/README.md"
cp "${model}/LICENSE.md" "${full}/LICENSE.md"


git init "${full}"

python -m venv "${full}/.venv"

# For source to work, run this script with source.
source "${full}/.venv/bin/activate"

git -C "${full}" add .
git -C "${full}" commit -m "Initial commit."

# End.
echo "(+) - Setup finished."
exit 0;

