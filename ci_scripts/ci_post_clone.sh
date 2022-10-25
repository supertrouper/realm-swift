#!/bin/sh

# Set the -e flag to stop running the script in case a command returns
# a non-zero exit code.
set -e

cd ..

if [ "$CI_WORKFLOW" = "SwiftLint" ]; then
    brew install swiftlint
    sh build.sh verify-swiftlint
fi
if [ "$CI_WORKFLOW" = "Docs" ]; then
    sh build.sh verify-docs
fi
if [ "$CI_WORKFLOW" = "Spm-Latest" ]; then
    sh build.sh verify-swiftpm
fi
if [ "$CI_WORKFLOW" = "Spm-Oldest" ]; then
    sh build.sh verify-swiftpm
fi
if [ "$CI_WORKFLOW" = "ObjectServer-Latest" ]; then
    sh build.sh setup-baas
    sh build.sh verify-osx-object-server
fi
if [ "$CI_WORKFLOW" = "ObjectServer-Oldest" ]; then
    sh build.sh setup-baas
    sh build.sh verify-osx-object-server
fi
if [ "$CI_WORKFLOW" = "SwiftUI" ]; then
    sh build.sh verify-swiftui-ios
fi
