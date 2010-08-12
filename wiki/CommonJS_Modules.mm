## page was renamed from commonjs_modules
= CommonJS Modules =
As of the 0.11 release of CouchDB you can use CommonJS 1.0 modules in your show, list, update, and validation functions. map and reduce functions '''can NOT''' use modules. This is because view results are stored in the B-tree, and if the module (which is now external to the view itself) was updated, CouchDB would not be aware of the changed module, & therefore would not recompute the view.

{{{#!highlight JavaScript
  {
   _id:"_design/test",
   language: "javascript",
   whatever : {
     stringzone : "exports.string = 'plankton';",
     commonjs : {
       whynot : "exports.test = require('../stringzone')",
       upper : "exports.testing = require('./whynot').test.string.toUpperCase()"
     }
   },
   shows: {
     simple: "function() {return 'ok'};",
     requirey : "function() { var lib = require('whatever/commonjs/upper'); return lib.testing; };"
   }
  }
}}}
Within a show function you can require CommonJS modules that are defined within object in your design document. The id you pass to require() is a / delimited list of property names to resolve the module string within the design document.

All imports are relative to the design document root unless they start with ./ or ../, these are referred to as "relative require" statements. Relative require statements only work within CommonJS modules they cannot be used directly inside your show, list, update and validation functions.
