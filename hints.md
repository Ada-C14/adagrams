# Hints

Given some problem, as programmers, we first need to break down the factors of the problem before we find a solution.

First, we think about the problem conceptually. Then, we liken the problem's factors, constraints, and concepts into representations of data.

For _Adagrams_, what are the concepts associated with the problem?

To represent those concepts as data, what data type is each concept?

Here is a table of terms/concepts for _Adagrams_ that we've found, what they mean, and, if applicable, how we would represent them as data.

Term | Definition | Representation
---    | ---  | ---
Letter or Tile | A single English capital letter | 1-character string (`"A"`, `"B"`, etc)
Letter Pool | The set of 98 letters (9 `A`s, 2 `B`s, etc) used to play the game | Up to you (see wave 1)
Hand | A set of 10 tiles that the player can use to construct a word | An array of ten 1-character strings, like `["A", "P", "K", "A", "E", "F", "W", "H", "F", "Q"]`
Word | A word submitted by the user | `"FISH"`, `"DEVELOPERS"`, `"ZZHYT"`, `"A"`
Drawing | Constructing a new hand using letters from the pool | method
