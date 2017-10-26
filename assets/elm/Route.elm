module Route exposing (Route(..), fromLocation, href)

import Html exposing (Attribute)
import Html.Attributes as Attr
import Navigation exposing (Location)
import UrlParser exposing (..)

type Route
    = Home
    | NewFeature
    | NotFound

href : Route -> Attribute msg
href route =
    Attr.href (routeToString route)

routeToString : Route -> String
routeToString route =
    let
        pieces =
            case route of
                Home ->
                    []

                NewFeature ->
                    [ "new_feature" ]

                NotFound ->
                    [ "404" ]
    in
    "#/" ++ String.join "/" pieces

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map Home top
        , map NewFeature (s "new_feature")
        ]

fromLocation : Location -> Route
fromLocation location =
     case (parseHash matchers location) of
         Just route ->
             route

         Nothing ->
             NotFound
