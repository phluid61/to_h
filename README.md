to_h
=====

Description
-----------

Add SomePairs#to_h for compatbility with Ruby 2.0~  
http://d.hatena.ne.jp/nagachika/20120416/ruby_trunk_changes_35337_35352

Features
--------

* Hash#to_h
* Struct#to_h
* ENV.to_h
* NilClass#to_h
* OpenStruct#to_h

Usage
-----

### Basic

```ruby
require 'to_h'
```

### With OpenStruct

```ruby
require 'ostruct'
require 'ostruct/to_h'
```

Requirements
-------------

* Ruby - [1.8.7 or later](http://travis-ci.org/#!/kachick/to_h)

Install
-------

```bash
$ gem install to_h
```

Build Status
-------------

[![Build Status](https://secure.travis-ci.org/kachick/to_h.png)](http://travis-ci.org/kachick/to_h)

Link
----

* [code](https://github.com/kachick/to_h)
* [API](http://kachick.github.com/to_h/yard/frames.html)
* [issues](https://github.com/kachick/to_h/issues)
* [CI](http://travis-ci.org/#!/kachick/to_h)
* [gem](https://rubygems.org/gems/to_h)

License
--------

The MIT X11 License  
Copyright (c) 2012 Kenichi Kamiya  
See MIT-LICENSE for further details.

