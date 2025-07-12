#!/usr/bin/env bash

rm bundle.zip
zip -r bundle.zip main.tf 
aws s3 cp bundle.zip s3://$@