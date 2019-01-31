#!/usr/bin/env bash

declare -r GENERATED_SNIPPETS_DIRECTORY=~/workspace/credhub-release/src/credhub/build/generated-snippets
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
    find ${GENERATED_SNIPPETS_DIRECTORY} -name \*.adoc -exec cp {} "${SNIPPETS_BUILD_DIRECTORY}" \;
}

function copy_asciidoc_templates_to_build_directory() {
    cp templates/*.adoc "${ASCIIDOC_BUILD_DIRECTORY}"
}

function convert_asciidoc_to_intermediary_docbook_format() {
    asciidoctor \
        -q \
        -b docbook \
        -D "${DOCBOOK_BUILD_DIRECTORY}" \
        "${ASCIIDOC_BUILD_DIRECTORY}/*.adoc"
}

function convert_intermediary_docbook_format_to_markdown() {
    for file in ${DOCBOOK_BUILD_DIRECTORY}/*.xml; do
       local -r base_file_name_without_extension=$(echo $(basename $file .xml) | sed -e 's/-template//')
       pandoc \
           -f docbook \
           -t gfm \
           -o ${MARKDOWN_BUILD_DIRECTORY}/_${base_file_name_without_extension}.md \
           $file
    done
}

function fix_headers() {
   for file in ${MARKDOWN_BUILD_DIRECTORY}/*.md; do
      sed -i "" 's/^## HTTP Request/### HTTP Request/g' $file
      sed -i "" 's/^## Request Parameters/### Request Parameters/g' $file
   done
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
    fix_headers
    copy_markdown_to_api_docs_repo
    display_finish_message
}

main
