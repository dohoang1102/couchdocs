=== Building from source on *nix based systems. ===

Most *nix based systems have access to compilers like GCC, and other build utilities like Make to build software for a specific system.  The following is a generic example of the required syntax used when building CouchDB  with the Make utility.  Please remember that you will need to satisfy any dependencies that CouchDB may have before you can successfully build and run CouchDB.  

Example 1
{{{
make clean && make distclean && ./bootstrap && ./configure && make check && make
}}}

'''Tips/Hints'''

  * If you have trouble/wired errors building from source, it is always good starting point to reset the repository to a clean state and retry.
  * *nix generally refers to Unix or Unix like systems including Linux, BSD, etc.
