module App exposing(..)

import Models exposing (Model)
import Msg exposing (Msg(..))
import Navigation exposing(Location)
import Route exposing (Route(..))

init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Route.fromLocation location
    in
        ( Models.init currentRoute, Cmd.none )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetRoute route ->
            ( { model | currentRoute = route }, Cmd.none)
        AddFeature ->
            ( model, Cmd.none )
        StoreFeatures features ->
            ( { model | features = features }, Cmd.none )
        DragStart position ->
            ( model, Cmd.none )
        NoOp ->
            ( model, Cmd.none )
