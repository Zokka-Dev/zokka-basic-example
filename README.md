# Basic Example of using the Zelm compiler

This is a basic example of how the Zelm compiler allows us to override package
versions in order to fix a bug in `elm/core`.

`elm/core` has a bug which can cause an application to hang forever with
certain `String` operations, as demonstrated in
[https://github.com/elm/core/pull/1137](https://github.com/elm/core/pull/1137).
We can use Zelm to override the default `elm/core` with a version of `elm/core`
that fixes this bug.

## Building this example

To compare and contrast Elm vs Zelm, we can first use Elm to build this.

Run

```
elm make src/Main.elm
```

Now when you open `index.html` in your web browser of choice, you should see a
blank page that is just hanging due to infinite Javascript execution.

Let's switch to Zelm.

```
zelm make src/Main.elm
```

Now open `index.html` again in your web browser. You should see `The length of
hangsInVanillaElm is 1` appear.

Now go ahead and open `elm.json`. You'll see that we've added a new field called
`zelm-package-overrides`, which tells us we are overriding `elm/core` version
`1.0.5` with `zelm/elm-core-1-0-override` version `1.0.0`.
`zelm/elm-core-1-0-override` contains the bug fix that we are using. This means
everywhere in our dependency tree we replace `elm/core:1.0.5` with
`zelm/elm-core-1-0-override:1.0.0`, even in transitive dependencies.

This allows us to take full advantage of all the bug fixes provided in our
override package.
