module Page.Home exposing (view)

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
import Route exposing (Route(..))
import Msg exposing (Msg(..))

view :  Html Msg
view =
    div [ class "ugh" ]
        [ div [ class "line vertical" ] [ ]
        , div [ class "line horizontal" ] [ ]
        , div [ class "effort-parent" ]
              [ div [ class "low-effort" ] [ text "Low effort" ]
              , div [ class "high-effort" ] [ text "High effort" ]
              ]
        , div [ class "value-parent" ]
              [ div [ class "low-value" ] [ text "Low value" ]
              , div [ class "high-value" ] [ text "High value" ]
              ]
        , div [ class "add-feature" ]
              [ button [ onClick AddFeature ] [ text "Add Feature" ]
              , a [ Route.href NewFeature ] [ text "New Feature" ]
              ]
        ]
