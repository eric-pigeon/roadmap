module Page.Layout exposing (view)

import Html exposing (..)
import Html.Attributes
    exposing
        ( alt
        , attribute
        , class
        , for
        , href
        , id
        , src
        , type_
        )
import Html.Events exposing (onClick)

import Msg exposing (Msg(..))
import Model exposing (Model)

view : Model -> Html msg -> Html msg
view model body =
    body
