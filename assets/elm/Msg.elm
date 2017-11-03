module Msg exposing (Msg(..))

import Route exposing (Route)
import Models.Feature exposing (Feature)

type Msg
    = SetRoute Route
    | AddFeature
    | StoreFeatures (List Feature)
    | NoOp
