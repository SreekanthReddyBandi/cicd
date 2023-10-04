#! /bin/bash

export LANG=en_US.UTF-8

source ./env_var.sh
source ./fastlane/xcode_version

install_fastlane_with_brew() {
  brew install fastlane
}


install_fastlane_with_bundler() {
  echo "source \"https://rubygems.org\""  >> Gemfile
  echo "" >> Gemfile
  echo "gem \"fastlane\"" >> Gemfile
  bundle install --path="./gem"
}

install_xcode() {
  bundle _${BUNDLE_VERSION}_ exec fastlane run xcode_install version:$XCODE_VERSION
  xcode-select --install
  sudo xcodebuild -license accept
  xcodebuild -runFirstLaunch
}

create_temp_dir() {
  mkdir temp 
  cd temp 
}

rm_temp_dir() {
  cd ..
  rm -rf temp 
}

prepare_project() {
   ./prepare.sh
}

install_certificates() {
    ./run_bundle.sh exec fastlane certificates git_url:git@bitbucket.org:twgnz/mob-ios-signing.git --env tw.development
} 

xcode-select --install

sudo gem install bundler -v ${BUNDLE_VERSION}
create_temp_dir
#if install fastlane with bundle you can use install_fastlane_with_brew
install_fastlane_with_bundler
install_xcode
rm_temp_dir

prepare_project
install_certificates







