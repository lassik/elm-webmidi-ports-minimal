module Main exposing (..)

import CoMidi
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
    model.midiEvent |> CoMidi.parseMidiEvent |> toString |> Html.text


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
