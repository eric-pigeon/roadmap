module Main exposing (..)

import App exposing(init, update)
import Model exposing(Model)
import Msg exposing (Msg(..))
import Navigation exposing (Location)
import View exposing(view)
import Route

main : Program Never Model Msg
main =
    Navigation.program
        (Route.fromLocation >> SetRoute)
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
