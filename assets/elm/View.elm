module View exposing(view)

import Html exposing(Html, div, span, text)
import Model exposing (Model)
import Msg exposing (Msg(..))
import Page.Layout
import Page.Home
import Page.NewFeature
import Route exposing (Route(..))

view : Model -> Html Msg
view model =
    Page.Layout.view model <|
        case model.currentRoute of
            Home ->
                Page.Home.view
            NewFeature ->
                Page.NewFeature.view
            NotFound ->
                text "Not found"
