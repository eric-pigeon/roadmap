module Models.Feature exposing (Feature, decoder)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Pipeline exposing (required)

type alias Feature =
    { id : String
    , name : String
    , effort : Int
    , value : Int
    }


decoder : Decoder Feature
decoder =
    Pipeline.decode Feature
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "effort" Decode.int
        |> required "value" Decode.int
