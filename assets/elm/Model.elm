module Model exposing (Model, init)

import Route exposing (Route)

type alias Model =
    { currentRoute : Route }

init : Route -> Model
init initialRoute =
    {
        currentRoute = initialRoute
    }
