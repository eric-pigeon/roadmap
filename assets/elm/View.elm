module View exposing(view)

import Html exposing(Html, div, span, text)
import Models exposing (Model)
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
                Page.Home.view model
            NewFeature ->
                Page.NewFeature.view
            NotFound ->
                text "Not found"
