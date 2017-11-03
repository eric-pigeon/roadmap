module Main exposing (..)

import App exposing (init, update)
import Models exposing (Model)
import Models.Feature as Feature exposing (Feature, decoder)
import Msg exposing (Msg(..))
import Navigation
import Json.Decode as Decode exposing (Decoder, Value)
import View exposing(view)
import Phoenix
import Phoenix.Channel as Channel exposing (Channel)
import Phoenix.Socket as Socket exposing (Socket)
import Route

socket : String -> Socket Msg
socket socketLocation =
    Socket.init socketLocation

parseFeatures : Value -> List Feature
parseFeatures =
    Decode.decodeValue (Decode.list Feature.decoder)
        >> Result.withDefault [ ]

loadFeatures : Value -> Msg
loadFeatures = parseFeatures >> StoreFeatures

channels : Model -> List (Channel Msg)
channels model =
    [ Channel.init "features:lobby" |> Channel.onJoin loadFeatures ]

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Phoenix.connect (socket model.wsBaseUrl) (channels model) ]

main : Program Never Model Msg
main =
    Navigation.program
        (Route.fromLocation >> SetRoute)
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
