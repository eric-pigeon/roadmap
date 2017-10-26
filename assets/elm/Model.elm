module Model exposing (Model, init)

import Route exposing (Route)

type alias Model =
    { currentRoute : Route
    }

init : Model
init =
    {
        currentRoute = Route.Home
    }
