file = File.open("Gemfile", "a")
file.puts("gem 'pry'")
file.close

file = File.open("Gemfile", "r")
puts "Voici le contenu de ton Gemfile :"
puts file.read
file.close
