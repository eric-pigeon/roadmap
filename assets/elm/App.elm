module App exposing(..)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Navigation exposing(Location)
import Route exposing (Route(..))

init : Location -> ( Model, Cmd Msg )
init location =
    ( Model.init 
    , Cmd.none
    )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetRoute route ->
            ( { model | currentRoute = NewFeature }
            , Cmd.none
            )
        AddFeature ->
            ( model, Cmd.none )
        NoOp ->
            ( model, Cmd.none )
