module Page.Layout exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Models exposing (Model)

view : Model -> Html msg -> Html msg
view model body =
    body
