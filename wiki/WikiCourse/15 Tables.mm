## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
##master-page:
##master-date:
#acl -All:write Default
#format wiki
#language en
#pragma section-numbers off
<<Navigation(slides)>>
= Tables =
== Simplest table ==
{{{
 || one || two || three ||
 || four || five || six ||
}}}

 || one || two || three ||
 || four || five || six ||

== General table layout ==
{{{
 ||||||<tablewidth="80%">'''Headline'''||
 ||Cell 1||Cell 2||Cell 3||
 ||<rowspan=2> Two lines||||<bgcolor="#AAAAFF"> Two columns||
 ||<rowbgcolor="#FFFFAA">Cell 2||Cell 3||
}}}

 ||||||<tablewidth="80%">'''Headline'''||
 ||Cell 1||Cell 2||Cell 3||
 ||<rowspan=2> Two lines||||<bgcolor="#AAAAFF"> Two columns||
 ||<rowbgcolor="#FFFFAA">Cell 2||Cell 3||

== Cell width ==
{{{
 || Narrow ||<:99%> Broad ||
}}}
 || Narrow ||<:99%> Broad ||

== Spanning rows and columns ==
{{{
 ||<|2> 2 lines || line 1 ||
 || line 2 ||
 ||<-2> line 3, 2 columns broad ||
}}}
 ||<|2> 2 lines || line 1 ||
 || line 2 ||
 ||<-2> line 3, 2 columns broad ||

== Alignment ==
{{{
 ||<(50%> left ||<^|3> up ||<v|3> down ||
 ||<:> mid ||
 ||<)> right ||
}}}
 ||<(50%> left ||<^|3> up ||<v|3> down ||
 ||<:> mid ||
 ||<)> right ||

== Colors ==
{{{
 ||<#FF0000> red ||<#00FF00> green ||<#0000FF> blue ||
}}}
 ||<#FF0000> red ||<#00FF00> green ||<#0000FF> blue ||
