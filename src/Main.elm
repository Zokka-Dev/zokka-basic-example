module Main exposing (..)

import Html

main = 
    let
        -- From https://github.com/elm/core/pull/1137
        stringThatTriggersBug = "foobar😈"
        hangsInVanillaElm = String.right 1 "foobar😈" |> String.toList
    in
    Html.text ("The length of hangsInVanillaElm is " ++ String.fromInt (List.length hangsInVanillaElm))
