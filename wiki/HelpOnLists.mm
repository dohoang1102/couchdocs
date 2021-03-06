## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
## Please edit (or translate) system/help pages on the moinmaster wiki ONLY.
## For more information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:Unknown-Page
##master-date:Unknown-Date
#acl MoinPagesEditorGroup:read,write,delete,revert All:read
#format wiki
#language en
== Lists and Indenting ==
You can create bulleted and numbered lists in a quite natural way. All you do is inserting the line containing the list item. To get bulleted items, start the item with an asterisk "{{{*}}}"; to get numbered items, start it with a number template "{{{1.}}}", "{{{a.}}}", "{{{A.}}}", "{{{i.}}}" or "{{{I.}}}". Anything else will just indent the line. To start a numbered list with a certain initial value, append "{{{#}}}''value''" to the number template.

/!\ The asterisk and the number template must be preceded and followed by at least one space.

To nest lists of different levels, you use different depths of indenting. All items on the same indent level belong to the same (sub-)list. That also means that you cannot change the style of a list after you started it.

Definition lists can be created by items of the form {{{<whitespace>term:: definition}}}; note that the ''term'' cannot currently contain any wiki markup.

For more information on the possible markup, see HelpOnEditing. 

=== Example ===
{{{
If you indent text
  like this, then it is indented in the output
    you can have multiple levels of indent

And if you put asterisks at the start of the line
  * you get a 
  * bulleted
  * list
    * which can also be indented
      * to several levels
  * you can put linebreaks in the wiki markup of a list item by
  indenting the additional lines at the same
  level as the initial star (or number) that began the list item.

A numbered list, mixed with bullets:
  1. one
  1. two
    1. one
      * bullet 1
      * bullet 2
    1. two
  1. three
    * bullet
      1. one

Variations of numbered lists:
  * Lowercase roman
    i. one
    i. two
  * Uppercase roman (with start offset 42)
    I.#42 forty-two
    I. forty-three
  * Lowercase alpha
    a. one
    a. two
  * Uppercase alpha
    A. one
    A. two

 term:: definition
 another term:: and its definition
}}} 

=== Display ===
If you indent text
  like this, then it is indented in the output
    you can have multiple levels of indent

And if you put asterisks at the start of the line
  * you get a 
  * bulleted
  * list
    * which can also be indented
      * to several levels
  * you can put linebreaks in the wiki markup of a list item by
  indenting the additional lines at the same
  level as the initial star (or number) that began the list item.

A numbered list, mixed with bullets:
  1. one
  1. two
     1. one
        * bullet 1
        * bullet 2
     1. two
  1. three
     * bullet
        1. one

Variations of numbered lists:
  * Lowercase roman
    i. one
    i. two
  * Uppercase roman (with start offset 42)
    I.#42 forty-two
    I. forty-three
  * Lowercase alpha
    a. one
    a. two
  * Uppercase alpha
    A. one
    A. two

 term:: definition
 another term:: and its definition
