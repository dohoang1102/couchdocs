## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
## page was renamed from WikiCourse/18 Attachment
##master-page:
##master-date:
#acl -All:write Default
#format wiki
#language en
#pragma section-numbers off
<<Navigation(slides)>>
= Attachments =
With MoinMoin you can directly append files to a wiki page.

== Input ==
{{{
<<attachment:letter.txt>>

{{attachment:foto.jpg}}
}}}

== Display ==

<<attachment:letter.txt>>

{{attachment:foto.jpg}}

(!) As long as the files aren't uploaded:
 * the links are grey (like links to non-existent wiki pages).
 * an alternate image, like a paper clip, is displayed for non-existent embedded pictures.

You can click on it and upload the file from your computer's file system to the wiki using your browser. Then the design is regular and:
 * links are blue.
 * the image appears.

Further informations on HelpOnActions/AttachFile
