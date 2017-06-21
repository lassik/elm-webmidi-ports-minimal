# elm-webmidi-ports-minimal

Minimal working example of receiving Web MIDI messages in Elm.

## Why

As of Elm 0.18 there is confusion over how to best integrate Web MIDI
with Elm.  JavaScript interop is now done via ports, and the Elm
maintainers won't publish port modules in the official package
repository, so nobody can publish a working Web MIDI module as a
ready-to-use package. Work has been done
at <https://github.com/newlandsvalley/elm-webmidi-ports> but it's
quite involved so I decided to make this minimal working example in
order to really understand what's going on.

## Running

To try this, run `./build.sh` and then open `index.html` in your
browser (works on Mac Chrome, does not work on Mac Firefox).

## What you'll get

You'll get a page that receives MIDI messages from all MIDI inputs.
It displays a byte dump of the latest message received, so when you
press keys on your MIDI controller the display reacts.  Plugging
controllers in/out of USB is supported while the page is open (i.e. it
will receive messages from newly plugged-in controllers).

## Decoding

MIDI message contents are not decoded, this just shows the raw
bytes. Decoding is better done in an external library since that's not
dependent on the Web MIDI API and can be done in a purely functional
way -- e.g. MIDI files (`.mid`) contain messages in this same
format. See
<http://package.elm-lang.org/packages/newlandsvalley/elm-comidi/latest> for
work in this direction.
