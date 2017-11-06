module Msg exposing (Msg(..))

import Route exposing (Route)
import Mouse exposing (Position)
import Models.Feature exposing (Feature)

type Msg
    = SetRoute Route
    | AddFeature
    | StoreFeatures (List Feature)
    | DragStart Position
    | NoOp
