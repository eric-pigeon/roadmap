module Models exposing (Model, init)

import Route exposing (Route)
import Models.Feature exposing (Feature)

type alias Model =
    { currentRoute : Route
    , wsBaseUrl : String
    , features : List Feature
    }

init : Route -> Model
init initialRoute =
    {
        currentRoute = initialRoute,
        wsBaseUrl = "ws://localhost:4000/socket/websocket",
        features = []
    }

