## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
== Enabling the AttachFile action ==

The `AttachFile` action lets a page have multiple attached files.
Since file uploads could be abused for DoS (Denial of Service) attacks, `AttachFile` is an action that has to be enabled by the wiki administrator. See [wiki:Self:HelpOnConfiguration#file-attachments Configuration of MoinMoin] for details.

== Creating attachments ==

To create a new attachment, you can either add an attachment link to any page (see below on how to do that), or click on the `AtttachFile` link at the bottom of the page. In the first case, you will see an `Upload new attachment` link after saving the page. Clicking on it will lead you to the upload page, just like directly clicking on the `AttachFile` link.

The upload form consist of three fields, in addition to the file input there are two optional fields, one to specify a MIME type for the file (which will be detected automatically otherwise), the second to store the file under a different name than on your own computer.

An upload will never overwrite an existing file. If there is a name
conflict, you have to rename the file that you want to upload.
Otherwise, if "Rename to" is left blank, the original filename will be used.

Existing attachments may be viewed, downloaded, or removed, depending on the configuration of the wiki and the access rights of the user, if ACLs are enabled. For example, an attachment cannot be deleted if the user doesn't have the `delete` permission on the particular page.

Any upload or deletion of attachments is reflected on RecentChanges and thus subject to peer review. Unlike page changes, there is no history though, so ''keep a local copy of files'' so you can revert possible vandalism.

== Listing and information about attachments ==

Two macros are defined which give information about attachments on a page.  The {{{<<AttachInfo>>}}} macro gives a short sentance about any attachments:-

<<AttachInfo>>

The {{{<<AttachList>>}}} macro lists files attached to a page:-

<<AttachList>>

== Linking to attachments ==

To refer to attachments on a page, use `attachment:filename.ext`; a link of this kind follows all the rules for normal links, i.e. pictures are automatically inlined.
Do '''not''' use the URL of the `[get]` link you can see on the attachments upload page, 
since these links are subject to change and can break easily on reconfigurations of the wiki.
To refer to files attached to other pages, use `attachment:WikiName/filename.ext`.

Instead of `attachment:`, you can also use `inline:`, which tries to inline the attachment's content. For pictures (files ending in `.gif`, `.jpg`, `.jpeg`, or `.png`) there is no difference. For Python sources (i.e. attachments with a `.py` extension), they are shown as syntax-highlighted source displays. For all other files, the behaviour is the same as for simple `attachment:` links.

The third type of link is `drawing:`, explained in the next section.


== Editing vector drawings ==

A link looking like `drawing:picturename` will allow you to ''interactively'' edit vector diagrams via the built-in Java applet. The applet will then store three attachments, "`picturename.draw`", "`picturename.png`" and "`picturename.map`". After you first saved a drawing, the generated PNG picture is displayed for the `drawing:` link. The MAP is used to activate parts of the image as links. This means that you only need Java enabled for editing, while displaying the results works with any browser.

To edit a drawing after the first save, click on `AttachFile` and use the `[edit]` link that is displayed instead of `[view]` for the `.draw` attachment. You can also click on the invisible 5 pixel border around the picture to reach the edit mode. Saving a drawing is reflected in RecentChanges.

  /!\ Note: the applet is not WikiName sensitive. You need to supply actual (either relative or absolute) URLs as links.

  /!\ Note: drawings containing non-ascii characters in their name are not supported currently.

For details on using the drawing applet, see TWiki:Plugins/TWikiDrawPlugin.
