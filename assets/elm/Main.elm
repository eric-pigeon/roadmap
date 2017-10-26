module Main exposing (..)

import App exposing(init, update)
import Model exposing(Model)
import Msg exposing (Msg(..))
import Navigation exposing (Location)
import View exposing(view)
import Route

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

main : Program Never Model Msg
main =
    Navigation.program
        (Route.fromLocation >> SetRoute)
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
