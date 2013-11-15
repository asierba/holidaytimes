holidaytimes
============

web app to book your holidays

[![Build Status](https://travis-ci.org/asierba/holidaytimes.png?branch=master)](https://travis-ci.org/asierba/holidaytimes)
[![Coverage Status](https://coveralls.io/repos/asierba/holidaytimes/badge.png)](https://coveralls.io/r/asierba/holidaytimes)
[![Code Climate](https://codeclimate.com/github/asierba/holidaytimes.png)](https://codeclimate.com/github/asierba/holidaytimes)

Quickstart
----------
1. To install all the required libraries (and not the ones that only work on the server!)
    -   bundle install --without production

2. To setup the DB
    -   rake db:migrate

3. To run the web server
    -   rails s

Configuration
-------------
- To generate a configuration file for LDAP authentication provider (you must then add your active directory settings to ~/config/ldap.yml)
    -   rake configuration:generate\_ldap\_config

Others
------
For development database administration download [SQLite admin](http://sqliteadmin.orbmu2k.de/)
