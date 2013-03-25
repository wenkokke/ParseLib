## About ParseLib

ParseLib is a port of Utrecht University's Parser Combinators (from Haskell) to Frege,
to allow the usage of parser combinator parsers in a JVM environment.

The current version is a port of the [uu-tc package][uu-tc];
more specifically it ports `ParseLib.Simple` as `parselib.Simple`, and `ParseLib.Abstract`
as `parselib.Standard`. The reason for renaming `abstract` to `standard` is to avoid Java naming
conflicts. The functionality in `parselib.Standard` is neatly wrapped up in all expected typeclasses.
Furthermore, the names of several combinators have been adjusted to match those found in the
newer [uu-parsinglib package][uu-parsinglib].

### Control.Applicative

An implementation of `Control.Alternative` is provided with the package, as this typeclass
is not present in Frege. It is imported internally in the `parselib.Standard` package, but
not exported (for the obvious reasons). Therefore, one should import it as `Frege.control.Alternative`.


### Buildfile

To ease building the code, a small Buildfile has been included for use with the [buildr build tool][buildr].
A few of the usefull tasks are:

  - **compile**: compiles the Frege and Java code into `ParseLib/target`;
  - **run**: compiles and runs the examples found in `ParseLib/src/fr/parselib/examples`
    and `ParseLib/src/java/parselib/examples`.
    
*Note*: executing the compile-task should automatically download and run the Frege compiler.


[uu-tc]:          http://hackage.haskell.org/package/uu-tc
[uu-parsinglib]:  http://hackage.haskell.org/package/uu-parsinglib-2.7.4.1
[buildr]:         http://buildr.apache.org/installing.html
