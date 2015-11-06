# mruby-consul   [![Build Status](https://travis-ci.org/inokappa/mruby-consul.png?branch=master)](https://travis-ci.org/inokappa/mruby-consul)
Consul class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'inokappa/mruby-consul'
end
```
## example
```ruby
p Consul.hi
#=> "hi!!"
t = Consul.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
