port module WebMidi exposing (..)


type alias Message =
    { midiBytes : List Int }


port onMidiMessage : (Message -> msg) -> Sub msg


emptyMessage : Message
emptyMessage =
    { midiBytes = [ 0, 0, 0 ] }
