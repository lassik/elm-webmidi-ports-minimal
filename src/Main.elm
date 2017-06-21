module Main exposing (..)

import Html
import WebMidi


type alias Model =
    WebMidi.Message


type Msg
    = MidiMessage WebMidi.Message


init : ( Model, Cmd Msg )
init =
    ( WebMidi.emptyMessage, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    WebMidi.onMidiMessage MidiMessage


update : Msg -> Model -> ( Model, Cmd Msg )
update (MidiMessage message) model =
    ( message, Cmd.none )


view : Model -> Html.Html Msg
view model =
    Html.text (toString model.midiBytes)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
