#!/bin/bash

mkdir assets
cd assets || exit
mkdir images
mkdir icons
mkdir fonts

cd ..

mkdir lib
cd lib || exit

mkdir core
cd core || exit

mkdir managers
cd managers || exit
touch app_manager.dart
cd ..

mkdir errors
cd errors || exit
touch exceptions.dart
touch failures.dart
cd ..

mkdir network
cd network || exit
touch network_info.dart
cd ..

mkdir usecases
cd usecases || exit
touch usecase.dart
cd ..

mkdir utils
mkdir helpers
mkdir widgets

mkdir constants
cd constants || exit
touch constants.dart
cd ..

mkdir styles
cd styles || exit
touch app_colors.dart
touch app_themes.dart
cd ..

touch core.dart

cd ..

mkdir features

mkdir routes
cd routes || exit
touch custom_navigator.dart

cd ..

touch injection_container.dart
touch main.dart
