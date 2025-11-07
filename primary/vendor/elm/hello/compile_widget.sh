#!/usr/bin/bash

echo "compile widget for hello"

elm make ./src/Hello.elm --output hello.js
mv ./hello.js ../../../public/
