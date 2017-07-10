# README

## Description

WIP

Rails app to show slides generated from markdown using
[Remark.js](https://remarkjs.com/)

Imports markdown files from Dropbox from a specified folder

See `env.example` for environment variables

## Use
- Hit the endpoint `/refresh` to pull in markdown files from your dropbox (Hack), or
- use `import:dropbox` rake task
- use /admin to add things manually

## TODO
- use somekind of hook from Dropbox to notify of updates?
- sync Dropbox <-> Rails bi-directionally
- realtime editing/previewing of slides/markdown?
- field for dynamic styling?


