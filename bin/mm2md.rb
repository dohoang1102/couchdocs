require "rubygems"

input = IO.readlines('../wiki/HTTP_database_API.mm','').to_s

def substitute_pattern_in_string_with(pattern, string)
   string.scan(pattern).flatten.inject({}) do |acc, matched|
     acc[matched] = yield matched
     acc
   end.each do |matched, substitute|
     string.gsub!(matched, substitute)
   end
   
   return string
end
 
transformations = [
    { :regexp => /=+\s*?$/,                    :replacement => '' },        # headlines
                                                          
    # { :regexp => /^(?:(\{\{\{)|(\}\}\}))\s*?$/,:replacement => '....' },    # blocks (extra line)
    { :regexp => /\{\{\{(.*?)\}\}\}/,       :replacement => '`\1`' },       # blocks (inline)
                                                          
    { :regexp => /'''([^']+)'''/,              :replacement => '**\1**' },  # bold
    { :regexp => /''([^']+)''/,                :replacement => '*\1*' },    # italic
                                                          
    { :regexp => /_\_(\S)/,                    :replacement => '_\_\1' },   # escaping (italic)
    
    { :regexp => /<<TableOfContents\(.\)>>/,   :replacement => '' }         # drop some stuff
  ]

# do the basic stuff 
output = transformations.inject(input) do |txt, pattern|
  txt.gsub(pattern[:regexp], pattern[:replacement])
end

# transform headlines
output = substitute_pattern_in_string_with(/^=+/, output) do |matched_string|
  "#" * matched_string.length
end

# doing blocks
output = substitute_pattern_in_string_with(/\{\{\{.*?\}\}\}/m, output) do |matched_block|
  block = matched_block.split("\n")
  block.shift
  block.pop
  "\n" << block.each.inject("") do |acc, line|
    acc << "    " << line << "\n"
  end
  
end

puts output






















