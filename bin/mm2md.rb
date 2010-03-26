require "rubygems"

input = IO.readlines('../wiki/Installation.mm','').to_s

markdown = [
    # headlines
    {
      :regexp => /=+\s*?$/,
      :replacement => ''
    },
    {
      :regexp => /^=+/,
      :replacement => lambda {|match| "#" * match.length}
    },


    # blocks (inline code)
    {
      :regexp => /\{\{\{(.*?)\}\}\}/,
      :replacement => '`\1`'
    },
    
    # doing blocks/code
    {
      :regexp => /\{\{\{.*?\}\}\}/m,
      :replacement => lambda do |match|
        block = match.split("\n")
        block.shift
        block.pop
        "\n" << block.each.inject("") do |acc, line|
          acc << "    " << line << "\n"
        end
      end
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

    # processing tables
    {
      :regexp => /^\s(\|\|.*?)^\s([^\|])/m,
      :replacement => lambda do |match|
        table = $1
        rest = $2 # this a bit ugly, but it works

        table.gsub!(/&/, '&amp;')
        # ruby does not support look behind! :(
        # table.gsub!(/(?!\|\|)</, '&lt;')
        # table.gsub!(/(?!\|\|<-\d)>/, '&gt;')

        table.gsub!(/^\|\|<\|(\d+)>/, '  <tr><td rowspan="\1">')
        table.gsub!(/^\|\|<-(\d+)>/, '  <tr><td colspan="\1">')
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
    },

    {
      :regexp => /(^\s*(\*[^\*].*?)^$)/m,
      :replacement => "\n\\1"
    },

    # comment out some unsupported stuff
    # TOC
    {
      :regexp => /(<<TableOfContents\(.\)>>)/,
      :replacement => '<!-- \1 -->'
    }
  ].inject(input) do |txt, pattern|
    if pattern[:replacement].respond_to?(:call)
      txt.gsub(pattern[:regexp], &pattern[:replacement])
    else
      txt.gsub(pattern[:regexp], pattern[:replacement])
    end
end

puts markdown