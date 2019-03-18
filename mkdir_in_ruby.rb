def check_if_user_input
  abort("mkdir: missing input") if ARGV.empty?
end

def get_mkdiruby_name
  return folder_name = ARGV.first
end

def create_folder(name)
  Dir.mkdir(name)
end

def git_init
  system('git init')
  env = File.open('.env', 'a')
  gitignore = File.open('gitignore', 'a')
  gitignore.puts('.env')
end

def gemfile_init
  gemfile = File.open('Gemfile', 'a')
  gemfile.puts('source "https://rubygems.org"')
  gemfile.puts("ruby '2.5.3'")
  gemfile.puts("gem 'rspec'")
  gemfile.puts("gem 'rubocop'")
  gemfile.puts("gem 'pry'")
  gemfile.puts("gem 'watir'")
  system('bundle install')
end

def file_init
  Dir.mkdir('lib')
  Dir.mkdir('db')
  app = File.open('app.rb', 'a')
  app.puts("require 'bundler'")
  app.puts('Bundler.require')
  app.puts("$:.unshift File.expand_path('./../lib', __FILE__)")
  system('rspec --init')
  readme = File.open('README.md', 'a')
  readme.puts('This is a readme created with a Ruby script.')
end

def lib_init
  Dir.mkdir('app')
  Dir.mkdir('views')
end

def perform
  check_if_user_input
  create_folder(get_mkdiruby_name)
  pwd = system("pwd")
  Dir.chdir("#{ARGV.join()}/")
  file_init
  git_init
  gemfile_init
  Dir.chdir("lib/")
  lib_init
end

perform
