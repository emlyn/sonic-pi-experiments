# Before running this file, first run helpers/play_helper.rb to load the pl function

use_bpm 90

# pass it an array with pairs of note+duration:
pl [:C, 1, :D, 1, :E, 1, :C, 1]

# you can optionally pass sustain and release values as a fraction of total duration:
pl [:C, 1, :D, 1, :E, 1, :C, 1], 0.2, 0.2

# slur notes by passing the notes and lengths inside arrays:
pl [[:E, :F, :G], [1, 1, 2]]

# you can also play chords:
pl [[:E, :G], 1, [:F, :A], 1, chord(:G, :M), 2]
