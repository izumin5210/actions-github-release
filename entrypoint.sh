#!/bin/sh -l

#!/bin/sh -l

name="$1"
body="$2"
path="$3"
ghr_version="$4"

archive=ghr_${ghr_version}_linux_amd64
curl -L https://github.com/tcnksm/ghr/releases/download/${ghr_version}/${archive}.tar.gz | tar xzf -
sudo cp ./${archive}/ghr /usr/local/bin/
rm -rf ./${archive}

ghr \
  -username="${GITHUB_ACTOR}" \
  -repository="${GITHUB_REPOSITORY}" \
  -token="${GITHUB_TOKEN}" \
  -commitish="${GITHUB_SHA}" \
  -name="${name}" \
  -body="${body}" \
  ${GITHUB_REF} \
  ${path}
