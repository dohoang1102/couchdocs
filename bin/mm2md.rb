#!/usr/bin/env ruby
require 'fileutils'

target_dir = File.join(File.dirname(__FILE__), '../site/translated/')

def mm2md(input)
  markdown = [
      # lines beginning with # in MoinMoin seem to bit smth. special
      # since this are markdown headline markers, comment them out
      # and add an addional line
      {
        :regexp => /^#(.*?)$/m,
        :replacement => lambda {|match| "<!-- #{match.strip} -->" }
      },
      {
        :regexp => /(-->.(?!<!--))/m,
        :replacement => '\1'+"\n"
      },


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
        :regexp => /\{\{\{(?:#!highlight\s(.*?)$)?.*?\}\}\}/m,
        :replacement => lambda do |match|
          code_hl_lang = $1
          block = match.split("\n")
          block.shift
          block.pop
          code_hl = "    #!#{code_hl_lang}\n" if code_hl_lang
          "\n" << block.inject(code_hl || "") do |acc, line|
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

      # nasty, but necessary (normalize links)
      {
        :regexp => /\[\[(?:(.*?)\|+([^\]]*?))\]\]/,
        :replacement => '[[\1|\2]]',
      },

      # next, detect "simple" aliases for WikiLinks
      {
        :regexp => /\[\[(?:(?!(?:http|irc))(.*?)\|([^\]]*))\]\]/,
        :replacement => '[[\1]]',
      },

      # processing tables
      {
        :regexp => /^\s(\|\|.*?)^\s([^\|]?)/m,
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

      # detect links in text (without any given markup or ankor)
      # got the regexp from http://flanders.co.nz/2009/11/08/a-good-url-regular-expression-repost/
      {
        :regexp => /(?:\s|^)((?#Protocol)(?:(?:ht|f)tp(?:s?)\:\/\/|~\/|\/)?(?#Username:Password)(?:\w+:\w+@)?(?#Subdomains)(?:(?:[-\w]+\.)+(?#TopLevel Domains)(?:com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum|travel|[a-z]{2}))(?#Port)(?::[\d]{1,5})?(?#Directories)(?:(?:(?:\/(?:[-\w~!$+|.,=]|%[a-f\d]{2})+)+|\/)+|\?|#)?(?#Query)(?:(?:\?(?:[-\w~!$+|.,*:]|%[a-f\d{2}])+=?(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)(?:&(?:[-\w~!$+|.,*:]|%[a-f\d{2}])+=?(?:[-\w~!$+|.,*:=]|%[a-f\d]{2})*)*)*(?#Anchor)(?:#(?:[-\w~!$+|\/.,*:=]|%[a-f\d]{2})*)?)(?:\s|$)/,
        :replacement => %Q{ <a href="\\1">\\1</a> },
      },


      # basic processing of named links
      {
        :regexp => /\[\[(?:(.*?)\|([^\]]*?))\]\]/,
        :replacement => %Q{<a href="\\1">\\2</a>},
      },
      # ... and just links
      {
        :regexp => /\[\[(https?|irc|mailto):\/\/(.*?)\]\]/,
        :replacement => %Q{<a href="\\1">\\1</a>},
      },

      # Table of Contents
      {
        :regexp => /(<<TableOfContents\(\d*\)>>)/,
        :replacement => '[TOC]'
      },

      # <<BR>> -> <br />
      {
        :regexp => /<<BR>>/,
        :replacement => '<br />'
      },



      # drop some stuff
      {
        :regexp => /(<<Anchor\(.*?\)>>)/,
        :replacement => '<!-- \1 -->' + "\n",
      },

      {
        :regexp => /(\{\{attachment:.*?\}\})/,
        :replacement => '<!-- \1 -->' + "\n",
      }
    ].inject(input) do |txt, pattern|
      if pattern[:replacement].respond_to?(:call)
        txt.gsub(pattern[:regexp], &pattern[:replacement])
      else
        txt.gsub(pattern[:regexp], pattern[:replacement])
      end
  end

  markdown
end

# this is just for testing purposes
unless STDIN.tty?
  input = IO.readlines(File.join(File.dirname(__FILE__),'../wiki/FrontPage.mm'),'').to_s
  puts mm2md(input)
else
  FileUtils.mkdir_p(target_dir)
  Dir.glob(File.join(File.dirname(__FILE__),"../wiki/**mm")).each do |file|
    target_file = File.join(target_dir, File.basename(file, ".mm")) + ".md"
    File.open(target_file, 'w') do |f|
      puts "Transcoding #{File.basename(file)}"
      f.write("template: page.html\ntitle: #{File.basename(file, ".mm")}\n\n" + mm2md(File.read(file)))
    end
  end
end