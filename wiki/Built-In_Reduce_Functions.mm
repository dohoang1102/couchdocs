= Built-In Reduce Functions =
<<TableOfContents()>>

Currently (CouchDB 0.11.0) there are three built-in reduce functions. Built-in reduce functions are performed right inside CouchDB implemented in Erlang. In most cases it is very fast because they are way more efficient.

== Usage ==
To use built-in reduce functions, you simply need to replace your reduce function with a string containing {{{_count}}}, {{{_sum}}} or {{{_stats}}} (without any preceding or tailing whitespace).

Here is an example design document using build-in reduce functions:
{{{
{
  "_id":"_design/company",
  "_rev":"12345",
  "language": "javascript",
  "views":
  {
    "all_customers": {
      "map": "function(doc) { if (doc.type == 'customer')  emit(doc.id, 1) }",
      "reduce" : "_count"
    },
    "total_purchases_by_customer": {
      "map": "function(doc) { if (doc.type == 'purchase')  emit(doc.customer_id, doc.amount) }",
      "reduce": "_sum"
    }
  }
}
}}}

== Available Build-In Functions ==

=== _sum ===
{{{_sum}}} just sums up the emitted values. Therefore the mapped values need to be numbers.

The !JavaScript equivalent is:
{{{
function(keys, values, rereduce) {
  return sum(values);
}
}}}


=== _count ===
{{{_count}}} counts the emitted values. It's like {{{_sum}}} for {{{emit(foo, 1)}}}. The map function may emit anything you want.

The !JavaScript equivalent is:
{{{
function(keys, values, rereduce) {
  if (rereduce) {
    return sum(values);
  }
  else {
    return values.length;
  }
}
}}}


=== _stats ===

{{{_stats}}} calculates various numerical statistics on your emitted data. {{{_stats}}} requires, just like {{{_sum}}}, your emitted values to be numbers.

The reduce output looks like this:
{{{
{"update_seq":6,"rows":[
{"key":null,"value":{"sum":2,"count":2,"min":1,"max":1,"sumsqr":2}}
]}
}}}

{{{sum}}} and {{{count}}} is the equiverlent to {{{_sum}}} and {{{_count}}}. {{{min}}} and {{{max}}} are the minimum and maximum values of the emitted values. {{{sumsqr}}} is the sum over all square roots of the emitted values (useful for statistics calculations).
