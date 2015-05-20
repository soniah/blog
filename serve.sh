#!/bin/bash

rm -rf public
hugo server --buildDrafts --watch --verbose=true
