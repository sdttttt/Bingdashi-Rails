# Rails Blog

[![Build status](https://ci.appveyor.com/api/projects/status/ifpoju6rbax4kh0f?svg=true)](https://ci.appveyor.com/project/sdttttt/bingdashi-rails)
[![CodeFactor](https://www.codefactor.io/repository/github/sdttttt/bingdashi-rails/badge)](https://www.codefactor.io/repository/github/sdttttt/bingdashi-rails)
![Ruby](https://github.com/sdttttt/Bingdashi-Rails/workflows/Ruby/badge.svg)

## Description

This is My Blog, using Ruby on Rails builed.

不过现在已经使用静态Blog了.

目前这个项目没打算做下去.

## Build

- install Ruby
- install bunder
- install rails:6.0.0

> bundle install

> rails webpacker:install

> rails s

access localhost:3000

## production
delete config/master.key and credentials.yml.enc

> rails credential:edit

> rails assets:precompile
