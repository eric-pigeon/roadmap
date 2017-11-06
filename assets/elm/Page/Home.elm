module Page.Home exposing (view)

import Html exposing (..)
import Html.Attributes
    exposing
        ( attribute
        , class
        , style
        )
import Html.Events exposing (on)
import Route exposing (Route(..))
import Msg exposing (Msg(..))
import Models exposing (Model)
import Models.Feature exposing (Feature)
import Mouse exposing (Position)
import Json.Decode as Decode

view : Model -> Html Msg
view model =
    div [ ]
        (grid ++
        [ div [ class "add-feature" ] [ a [ Route.href NewFeature ] [ text "New Feature" ] ] ] ++
        List.map featurePartial model.features)

grid : List (Html msg)
grid = [ div [ class "line vertical" ] [ ]
       , div [ class "line horizontal" ] [ ]
       , div [ class "effort-parent" ]
             [ div [ class "low-effort" ] [ text "Low effort" ]
             , div [ class "high-effort" ] [ text "High effort" ]
             ]
       , div [ class "value-parent" ]
             [ div [ class "low-value" ] [ text "Low value" ]
             , div [ class "high-value" ] [ text "High value" ]
             ]
       ]

featurePartial : Feature -> Html Msg
featurePartial feature =
    div [ class "feature"
        , featureStyle (feature.effort, feature.value)
        , onMouseDown
        ] [ text feature.name ]

onMouseDown : Attribute Msg
onMouseDown =
  on "mouseDown" (Decode.map DragStart Mouse.position)

percent : Float -> String
percent number =
  toString number ++ "%"

featureStyle : (Int, Int) -> Attribute msg
featureStyle (effort, value) =
    style [ ("left", percent ((toFloat effort * 0.75) + 50))
          , ("top", percent ((toFloat value * 0.75 )+ 50))
          ]

