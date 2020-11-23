#!/usr/bin/env sh


echo "Building front end image"
cd frontend
docker build -t local/frontend .
echo "Front end image complete"

echo "Building presentation layer image"
cd ..
cd presentation-layer
docker build -t local/presentation-layer .
echo "Presentation layer image complete"

echo "
Created Images:

local/frontend        => Client-side application
local/presentation-layer    => Presentation layer
"