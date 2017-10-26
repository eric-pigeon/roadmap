module Page.NewFeature exposing(view)

import Html exposing (..)
import Msg exposing (Msg(..))
import Route exposing (Route(..))

view : Html Msg
view = a [ Route.href NewFeature ] [ text "New Feature" ]
