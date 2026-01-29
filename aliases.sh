#! /bin/sh

alias gbdate="git branch --format=\"%(authordate:iso) %(refname:lstrip=-1) %(contents:subject)\" | sort"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias l="ls -lah"
