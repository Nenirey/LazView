#!/usr/bin/env bash

function priv_clippit
(
    cat <<EOF
Usage: bash ${0} [OPTIONS]
Options:
    build   Build program
EOF
)

function priv_clean
(
    # Clean up all temporary files
    find . -iname '*.compiled' -delete
    find . -iname '*.ppu' -delete
    find . -iname '*.o' -delete
    find src/ -iname '*.bak' -delete
    find src/ -iname '*.or' -delete

    rm -f src/lazview.res lazview
    rm -f tools/extractdwrflnfo
    rm -rf src/lib
    rm -rf src/backup
    rm -r units/*
    rm -f src/versionitis
)

function priv_lazbuild
(
    if ! (which lazbuild); then
        source '/etc/os-release'
        case ${ID:?} in
            debian | ubuntu)
                sudo apt-get update
                sudo apt-get install -y lazarus{-ide-qt5,}
                ;;
        esac
    fi
    declare -r COMPONENTS='use/components.txt'
    if [[ -d "${COMPONENTS%%/*}" ]]; then
        git submodule update --init --recursive --force --remote
        if [[ -f "${COMPONENTS}" ]]; then
            while read -r; do
                if [[ -n "${REPLY}" ]] &&
                    ! (lazbuild --verbose-pkgsearch "${REPLY}") &&
                    ! (lazbuild --add-package "${REPLY}") &&
                    ! [[ -d "${COMPONENTS%%/*}/${REPLY}" ]]; then
                        declare -A VAR=(
                            [url]="https://packages.lazarus-ide.org/${REPLY}.zip"
                            [out]=$(mktemp)
                        )
                        wget --output-document "${VAR[out]}" "${VAR[url]}" >/dev/null
                        unzip -o "${VAR[out]}" -d "${COMPONENTS%%/*}/${REPLY}"
                        rm --verbose "${VAR[out]}"
                    fi
            done < "${COMPONENTS}"
        fi
        find "${COMPONENTS%%/*}" -type 'f' -name '*.lpk' -exec \
            lazbuild --add-package-link {} +
    fi
    find 'src' -type 'f' -name '*.lpi' -exec \
        lazbuild --no-write-project --recursive --no-write-project --widgetset=qt5 --build-mode=release {} + 1>&2
)

function priv_main
(
    set -euo pipefail
    if ((${#})); then
        case ${1} in
            build) priv_lazbuild ;;
            clean) priv_clean ;;
            *) priv_clippit ;;
        esac
    else
        priv_clippit
    fi
)

priv_main "${@}" >/dev/null
