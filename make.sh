#!/usr/bin/env bash

function priv_clippit
(
    cat <<EOF
Usage: bash ${0} [OPTIONS]
Options:
    build   Build program
EOF
)

function priv_use
(
    [[ -d 'components' ]] || mkdir 'components'
    for item in "${@}"; do
        declare -A VAR=(
            [url]="https://packages.lazarus-ide.org/${item}.zip"
            [out]=$(mktemp)
            [dir]=${item##/*}
        )
        wget --output-document "VAR[out]" "VAR[url]"
        unzip -o "VAR[out]" -d "components/${VAR[dir]}"
        rm --verbose "VAR[out]"
    done
)


function pub_build
(
    git submodule update --init --recursive
    priv_use "Abbrevia"
    find 'components' -type 'f' -name '*.lpk' -exec lazbuild --add-package-link {} \;
    find 'src' -type 'f' -name '*.lpi' -exec lazbuild --recursive --build-mode=release {} \;
)

function priv_main
(
    set -euo pipefail
    if !(which lazbuild); then
        source '/etc/os-release'
        case ${ID:?} in
            debian | ubuntu)
                sudo apt-get update
                sudo apt-get install -y lazarus
            ;;
        esac
    fi
    if ((${#})); then
        case ${1} in
            build) pub_build 1>&2 ;;
        esac
    else
        priv_clippit
    fi
)

priv_main "${@}" >/dev/null
