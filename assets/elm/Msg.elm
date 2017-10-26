module Msg exposing (Msg(..))

import Route exposing (Route)

type Msg
    = SetRoute Route
    | AddFeature
    | NoOp
