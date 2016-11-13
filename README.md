# sonic-pi-experiments
Somewhere to store my Sonic Pi setup and experiments so they don't get lost.
Feel free to use anything you find here as you like.
Attribution is optional (but always welcome).

# [init](/init.rb)

My Sonic Pi `init.rb` file. This is symlinked from `~/.sonic-pi/init.rb` and
loads the snippets and helper functions in this repo whenever Sonic Pi starts.

# [snippets](/snippets)

Useful snippets of code that can be loaded by typing a short key string followed by tab.

# [helpers](helpers)

Helper functions that will be automatically loaded into Sonic Pi when it starts up.
These will be available from any buffer in Sonic Pi.
Usually these started out as experiments; the ones that are useful enough get moved
into helpers so that I can easily access them later.

# [experiments](/experiments)

My Sonic Pi experiments. If something becomes useful enough to be moved into helpers
I'll leave the examples that use the helper in here.

## [Guitar](/guitar.spi)

Programmatically generate guitar chords and strum them.

## [Drum Machine](/drum_machine.spi) / [Sequencer](/sequencer.spi)

Drum sequencer (first attempt, and second more general version).

## [Arpeggiator](/arpeggiator.spi)

Arpeggiator inspired by [this](http://codepen.io/jakealbaugh/full/qNrZyw/).

## [Vibrato](/vibrato.spi)

Attempt to apply vibrato to a note.

## [MML](/mml.spi)

MML (Music Macro Language) interpreter and player, with some MML for Tetris, Mario and the Star Wars Cantina song.

## [Scope](/scope.spi) / [Lissajous](/lissajous.spi)

Making Lissajous figures with the new scope in SP 2.11.

## [Play Helper](/play-helper.spi)

Make it easier to play sequences of notes/chords of varying durations.

# [Covers](/covers)

Subdirectory containing various cover versions of songs.
