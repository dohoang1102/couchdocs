## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
## page was renamed from WikiCourse/10 Text layout with wiki-markup
##master-page:
##master-date:
#acl -All:write Default
#format wiki
#language en
#pragma section-numbers off
<<Navigation(slides)>>
= Text layout with wiki markup =

MoinMoin does ''not'' simply use HTML (the ''!HyperText Markup Language'' usually used for websites), but its own, simplified '''!MoinMoin Wiki Markup Language''', MoinMoin's convention for the input of content.

== HTML ==
{{{
<h1>Headline</h1>
<p>This is a link to my own homepage: <a href="/FirstnameLastname">FirstnameLastname</a></p>
<p>A list:
<ul>
 <li>foo</li>
 <li>bar</li>
</ul>
</p>
}}}

== MoinMoin wiki ==
{{{
= Headline =
This is a link to my own homepage: FirstnameLastname

A list:
 * foo
 * bar
}}}

(!) The MoinMoin wiki markup will be explained in more detail on the following pages.
