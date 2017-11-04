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
        , style
        )
import Html.Events exposing (onClick)
import Route exposing (Route(..))
import Msg exposing (Msg(..))
import Models exposing (Model)
import Models.Feature exposing (Feature)

import Debug as Debug exposing (log)

view : Model -> Html Msg
view model =
    div [ class "ugh" ]
        ([ div [ class "line vertical" ] [ ]
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
        ] ++ List.map featurePartial model.features)

featurePartial : Feature -> Html msg
featurePartial feature =
    div [ class "feature", featureStyle feature.effort feature.value ] [ text feature.name ]

px : Float -> String
px number =
  toString number ++ "%"

featureStyle : Int -> Int -> Attribute msg
featureStyle effort value =
    style [ ("left", px ((toFloat effort * 0.75) + 50))
          , ("top", px ((toFloat value * 0.75 )+ 50))
          ]

