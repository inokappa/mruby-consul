MRuby::Build.new do |conf|
  toolchain :gcc
  conf.gembox 'default'
  conf.gem git: 'https://github.com/mattn/mruby-uv.git'
  conf.gem git: 'https://github.com/mattn/mruby-uv.git'
  conf.gem '/tmp/mruby-consul'
end
