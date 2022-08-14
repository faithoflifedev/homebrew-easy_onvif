#! /usr/local/bin/bash

# derive the repo from the current one
repo=$(git config --get remote.origin.url | sed -e 's|https://github.com/||' | sed -e 's|homebrew-||' | sed -e 's|\.git||')

# get the version from the config file in the main repo 
version=$(wget -q https://raw.githubusercontent.com/${repo}/main/tool/config.yaml -O - | yq '.version' )

last_version=""

# get the previous commit version
if test -f ".last_version"; then
	last_version=$(cat .version)
fi

# confirm this is a new commit
if [ "$last_version" = "$version" ]; then
	echo "The config file has not been updated. Execution complete."

	exit
fi

archive="https://github.com/${repo}/archive/refs/tags/v${version}.tar.gz"

target="Formula/$(ls Formula)"

template=$(echo ${target} | sed -e 's/Formula/.tmpl/' | sed -e 's/\.rb/\.tmpl\.rb/')

checksum=$(wget -q ${archive} -O - | sha256sum | awk '{ print $1 }')

rm -rf ${target}

cat "${template}" \
	| sed -e "s/__VERSION__/${version}/" \
	| sed -e "s|__ARCHIVE__|${archive}|" \
	| sed -e "s/__CHECKSUM__/${checksum}/" \
> ${target}

git add .

git commit -m "${version}"

git push

echo "${version}" > .last_version