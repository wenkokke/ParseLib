ParseLib
========

ParseLib is a port of Utrecht University's Parser Combinators (from Haskell) to Frege,
to allow the usage of parser combinator parsers in a JVM environment.

The current version is a port of the `uu-tc` package, which can be found [on hackage][uu-tc];
more specifically it ports `ParseLib.Simple` as `parselib.Simple`, and `ParseLib.Abstract`
as `parselib.Standard`. The reason for renaming *abstract* to *standard* is to avoid Java naming
conflicts. The functionality in `parselib.Standard` is neatly wrapped up in all expected typeclasses.

An implementation of `Control.Alternative` is provided with the package, as this typeclass
is not present in Frege. It is imported internally in the `parselib.Standard` package, but
not exported (for the obvious reasons). Therefore, one should import it as `Frege.control.Alternative`.


Buildfile
=========

To ease building the code, a small Buildfile has been included for use with the [buildr][buildr]
buildtool. A few of the notable tasks are:

  - (**compile**) compiles the Frege and Java code into `ParseLib/target`;
  - (**run**) compiles and runs the examples found in `ParseLib/src/fr/parselib/examples`
    and `ParseLib/src/java/parselib/examples`.
    
*Note*: executing the compile-task should automatically download and run the Frege compiler.

[uu-tc]: http://hackage.haskell.org/package/uu-tc
[buildr]: http://buildr.apache.org/installing.html