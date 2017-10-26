module Route exposing (Route(..), fromLocation, href)

import Html exposing (Attribute)
import Html.Attributes as Attr
import Navigation exposing (Location)

type Route
    = Home
    | NewFeature

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
                    [ "categories" ]
    in
    "#/" ++ String.join "/" pieces

fromLocation : Location -> Maybe Route
fromLocation location = Just Home
