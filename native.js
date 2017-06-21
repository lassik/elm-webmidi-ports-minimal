"use strict";

var app;

// JS typed arrays confuse Elm.
function toNormalArray(obj) {
    var ans = [];
    for (var i = 0; i < obj.length; i++) {
        ans.push(obj[i]);
    }
    return ans;
}

function onMidiMessage(event) {
    app.ports.onMidiMessage.send({midiBytes: toNormalArray(event.data)});
}

function initMidiPort(port) {
    if ((port.type === "input") && (port.state === "connected")) {
        console.log("MIDI input connected:", port);
        port.onmidimessage = onMidiMessage;
    }
}

function onMidiStateChange(event) {
    initMidiPort(event.port);
}

function initMidi(midi) {
    midi.inputs.forEach(initMidiPort);
    midi.onstatechange = onMidiStateChange;
}

if (navigator.requestMIDIAccess) {
    navigator.requestMIDIAccess().then(initMidi, console.log);
}

app = Elm.Main.fullscreen();
