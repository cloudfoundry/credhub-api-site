#!/usr/bin/env bash

declare -r ASCIIDOC_BUILD_DIRECTORY=/tmp/credhub-documentation-build/asciidoc
declare -r DOCBOOK_BUILD_DIRECTORY=/tmp/credhub-documentation-build/docbook
declare -r MARKDOWN_BUILD_DIRECTORY=/tmp/credhub-documentation-build/markdown
declare -r SNIPPETS_BUILD_DIRECTORY=/tmp/credhub-documentation-build/asciidoc/snippets
declare -r API_DOCS_DIRECTORY=../credhub-api-docs

function setup_bash_error_handling() {
    set -euo pipefail
}

function setup_build_directory() {
    mkdir -p "${ASCIIDOC_BUILD_DIRECTORY}"
    mkdir -p "${DOCBOOK_BUILD_DIRECTORY}"
    mkdir -p "${MARKDOWN_BUILD_DIRECTORY}"
    mkdir -p "${SNIPPETS_BUILD_DIRECTORY}"
}

function clean_old_converted_files() {
    rm -f ${ASCIIDOC_BUILD_DIRECTORY}/*.adoc
    rm -f ${DOCBOOK_BUILD_DIRECTORY}/*.xml
    rm -f ${MARKDOWN_BUILD_DIRECTORY}/*.md
    rm -f ${SNIPPETS_BUILD_DIRECTORY}/*.adoc
}

function go_to_project_root_directory() {
    local -r script_dir=$( dirname "${BASH_SOURCE[0]}")

    cd "$script_dir/.."
}

function copy_spring_restdoc_snippets_to_build_directory() {
    cp ~/workspace/credhub-release/src/credhub/build/generated-snippets/api/v2/permissions/*.adoc "${SNIPPETS_BUILD_DIRECTORY}"
}

function copy_asciidoc_templates_to_build_directory() {
    cp templates/*.adoc "${ASCIIDOC_BUILD_DIRECTORY}"
}

function convert_asciidoc_to_intermediary_docbook_format() {
    asciidoctor \
        -b docbook \
        -D "${DOCBOOK_BUILD_DIRECTORY}" \
        "${ASCIIDOC_BUILD_DIRECTORY}/get-permission-template.adoc"
}

function convert_intermediary_docbook_format_to_markdown() {
    pandoc \
        -f docbook \
        -t gfm \
        -o "${MARKDOWN_BUILD_DIRECTORY}/_get-permission.md" \
        "${DOCBOOK_BUILD_DIRECTORY}/get-permission-template.xml"
}

function copy_markdown_to_api_docs_repo() {
   cp -R ${MARKDOWN_BUILD_DIRECTORY}/. ${API_DOCS_DIRECTORY}/includes
}

function display_finish_message() {
    echo "📚 Generated the following slate 'include' documentation snippets in ${API_DOCS_DIRECTORY}/includes:"
    echo ""
    ls "${MARKDOWN_BUILD_DIRECTORY}"
    echo "Changes must be pushed up from the credhub-api-docs directory"
}

function main() {
    setup_bash_error_handling
    setup_build_directory
    clean_old_converted_files
    go_to_project_root_directory
    copy_spring_restdoc_snippets_to_build_directory
    copy_asciidoc_templates_to_build_directory
    convert_asciidoc_to_intermediary_docbook_format
    convert_intermediary_docbook_format_to_markdown
    copy_markdown_to_api_docs_repo
    display_finish_message
}

main
