## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
== Changing CSS styles ==

/!\ With 1.2 this is a bit outdated, as we have theme support now.

The best way to change the visual appearance of your wiki site is by inherting the default MoinMoin styles and only changing those things you want to adapt to your likings. This avoids the work involved in copying new styles added during development to your own stylesheets. To do this, we use the CSS `@import`  mechanism like this:
{{{
/*  #python wiki styles */
@import url("/users/jh/wiki/css/moinmoin.css");

h1,h2,h3,h4,h5 {
    background-color: #88CCFF; /* #EECC99; */
}
a:link {
    color: #0096CC;
}
a:visited {
    color: #0063a5;
}
}}}

In the second line, we import the default styles as distributed with MoinMoin.
You have to change the URL to fit your system setup, likely to "`/wiki/css/moinmoin.css`".

In the following lines, we change the background color of headlines and the colors of hyperlinks. And that's it.

For more, see HelpOnConfiguration/CascadingStyleSheets and the [http://css-discuss.incutio.com/ css-discuss] wiki.

For a very clever idea to make CSS ''wiki editable'', see ESW:plain.css.
