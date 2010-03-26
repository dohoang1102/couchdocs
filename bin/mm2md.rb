require "rubygems"

input = IO.readlines('../wiki/Installation.mm','').to_s

transformations = [
    # headlines
    {
      :regexp => /=+\s*?$/,
      :replacement => ''
    },

    # { :regexp => /^(?:(\{\{\{)|(\}\}\}))\s*?$/,:replacement => '....' },    # blocks (extra line)

    # blocks (inline code)
    {
      :regexp => /\{\{\{(.*?)\}\}\}/,
      :replacement => '`\1`'
    },

    # bold
    {
      :regexp => /'''([^']+)'''/,
      :replacement => '**\1**'
    },
    # italic
    {
      :regexp => /''([^']+)''/,
      :replacement => '*\1*'
    },

    # escaping
    # italic
    {
      :regexp => /_\_(\S)/,
      :replacement => '_\_\1'
    },

    # comment out some unsupported stuff
    # TOC
    {
      :regexp => /(<<TableOfContents\(.\)>>)/,
      :replacement => '<!-- \1 -->'
    }
  ]

# do the basic stuff
output = transformations.inject(input) do |txt, pattern|
  txt.gsub(pattern[:regexp], pattern[:replacement])
end

# transform headlines
output.gsub!(/^=+/) do |match|
  "#" * match.length
end

# doing blocks/code
output.gsub!(/\{\{\{.*?\}\}\}/m) do |match|
  block = match.split("\n")
  block.shift
  block.pop
  "\n" << block.each.inject("") do |acc, line|
    acc << "    " << line << "\n"
  end
end

# do the tables!
output.gsub!(/^\s(\|\|.*?)^\s([^\|])/m) do |match|
  table = $1
  rest = $2

  table.gsub!(/&/, '&amp;')
  # ruby does not support look behind! :(
  # table.gsub!(/(?!\|\|)</, '&lt;')
  # table.gsub!(/(?!\|\|<-\d)>/, '&gt;')

  table.gsub!(/^\|\|<\|(\d+)>/, '<tr><td rowspan="\1">')
  table.gsub!(/^\|\|<-(\d+)>/, '<tr><td colspan="\1">')
  table.gsub!(/^\|\|/, "<tr><td>")
            
  table.gsub!(/\|\|$/, "</td></tr>")
            
  table.gsub!(/\|\|<\|(\d+)>/, '<td rowspan="\1">')
  table.gsub!(/\|\|<-(\d+)>/, '<td colspan="\1">')
  table.gsub!(/\|\|/, "</td><td>")

  # undo some markdown syntax, since they are not supported in block-elements like tables
  table.gsub!(/\*\*([^\*]+)\*\*/, '<strong>\1</strong>')
  table.gsub!(/\*([^\*]+)\*/, '<em>\1</em>')

  "<table>" << "\n" << table << "</table>" << "\n\n" << rest
end

puts output