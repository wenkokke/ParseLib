ParseLib
========

ParseLib is a port of Utrecht University's Parser Combinators (from Haskell) to Frege,
to allow the usage of parser combinator parsers in a JVM environment.

The current version is a port of the `uu-tc` package, which can be found [on hackage][uu-tc];
more specifically, it ports the default library (known as `ParseLib.Simple`).
This means that the library overwrites a number of default functions, mostly from the
`Applicative` class[^overrides].

[uu-tc]: http://hackage.haskell.org/package/uu-tc
[^overrides]: The specific list is `>>=`, `<$>`, `<*>`, `<*`, `*>` and `sequence`.