require 'launchy'

def check_if_user_input
  abort('mkdir: missing input') if ARGV.empty?
end

def url_definer
  'https://www.google.com/search?q=' + ARGV.join('+')
end

def research(url)
  Launchy.open(url)
end

check_if_user_input
research(url_definer)
