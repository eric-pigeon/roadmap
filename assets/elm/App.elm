module App exposing(..)

import Model exposing (Model)
import Msg exposing (Msg(..))
import Navigation exposing(Location)
import Route exposing (Route(..))

init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Route.fromLocation location
    in
        ( Model.init currentRoute, Cmd.none )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetRoute route ->
            ( { model | currentRoute = route }, Cmd.none)
        AddFeature ->
            ( model, Cmd.none )
        NoOp ->
            ( model, Cmd.none )
