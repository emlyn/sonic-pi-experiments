# -*- mode: ruby;-*-
# Smoke on the Water - Deep Purple
# Uses the play_helper and sequencer helpers

use_debug false
use_bpm 110

#### Some helper functions

define :bar do |n|
  # beat time at start of bar n
  return 4 * n
end

#### Define the different drum beats

define :beat1 do # 1 bar
  # during intro
  seq [:drum_cymbal, "cccc"*4,
       :drum_bass,   "X.X."*4], 0.25
end

define :beat2 do # 1 bar
  # after beat1
  seq [:drum_cymbal,  "cccc.ccc"*2,
       :drum_bass,    "X.X.X.X."*2,
       :drum_tom_mid, "....X..."*2], 0.25
end

define :beat3 do # 1 bar
  # last bar before verse starts
  seq [:drum_cymbal,  "c.c.c.c.........................",
       :drum_bass,    "X.......X.......X.......X.......",
       :drum_tom_mid, "........X...XXXXX.X...XXX.X.X..."], 0.125
end

define :beat4 do # 4 bars
  # during verse
  seq [:drum_cymbal,  "o...c...c...c...",
       :drum_bass,    "X.......X.X.....",
       :drum_tom_mid, "....X.......X..."], 0.25
  
  seq [:drum_cymbal,  "c...c..."*2,
       :drum_bass,    "X.X....."*2,
       :drum_tom_mid, "....X..x"*2], 0.25
  
  seq [:drum_cymbal,  "c.c.c.c.c.c.c.c.",
       :drum_bass,    "X.......X.X.....",
       :drum_tom_mid, "....X..x....X..x"], 0.25
  
  seq [:drum_cymbal,  "o.c.c.c.c.c.c...",
       :drum_bass,    "X.......X.X.....",
       :drum_tom_mid, "....X..x....X..x",
       :drum_tom_hi,  "..............x."], 0.25
end

#### Define the instrumental parts

define :lead_intro do # 4 bars
  sus=0.8
  rel=0.15
  pl [[:D, :G], 1, [:F, :Bb], 1, [:G, :C5], 1, :r, 0.5], sus, rel
  pl [[:D, :G], 1, [:F, :Bb], 1, [:Ab, :Db5], 0.5, [:G, :C5], 1.5, :r, 0.5], sus, rel
  pl [[:D, :G], 1, [:F, :Bb], 1, [:G, :C5], 1, :r, 0.5], sus, rel
  pl [[:F, :Bb], 1, [:D, :G], 1.5, :r, 2], sus, rel
end

define :lead_verse do
  Gm = (chord :G4, :m, invert: -1) # :D4, G4, :Bb4
  Gm2= (chord :G4, :m, invert: -2) # :Bb3, :D4, G4
  Gm7= (chord :G4, :m7, invert: -3)# :Bb3, :D4, :F4, :G4
  F  = (chord :F4, :M, invert: -1) # :C4, :F4, :A4
  
  pl [Gm, 0.5, Gm, 0.5, :r, 2, Gm, 0.5, F[1..-1], 0.5]*2
  pl [Gm, 1, Gm, 1, F, 0.5, F, 0.5, :r, 0.5]
  pl [Gm2, 2.5, [:D4,:r], 0.25, [:Bb3,:r], 0.25, [:G3,:r], 0.5, :r, 1]
  
  pl [Gm, 0.5, Gm, 0.5, :r, 0.5, Gm, 0.5, :r, 1, Gm, 0.5, :r, 0.5]*2
  pl [Gm, 1, Gm, 1, F, 0.5, F, 0.5, :r, 0.5]
  pl [F, 1.5, :r, 2.5, :F4, 0.5]
  
  pl [Gm, 0.5, Gm, 0.5, :r, 0.5, Gm, 0.5, :r, 0.5, Gm, 0.5, :r, 1]*2
  pl [Gm, 1, Gm, 1, F, 0.5, F, 0.5, :r, 0.5]
  pl [Gm2, 1.5, Gm7, 1, Gm7, 1, [:D4,:r], 0.25, [:Bb3,:r], 0.25, [:G3,:r], 0.25, :r, 0.25]
  
  pl [Gm, 0.5, Gm, 0.5, :r, 0.5, Gm, 0.5, :r, 1, Gm, 0.5, :r, 0.5]
  pl [Gm, 0.5, Gm, 0.5, :r, 0.5, Gm, 0.5, :r, 1, Gm, 0.5, Gm, 0.5]
  pl [Gm, 1, Gm, 1, F, 0.5, F, 0.5, :r, 0.5, Gm2, 2.5, :r, 2]
end

define :lead_chorus do
  at [0, 1, 2], [[:C4, 4], [:G4, 3], [:E5, 2]] do |notes|
    pl notes
  end
  sleep 4
  at [0, 1, 2], [[:Ab3, 4], [:Eb4, 3], [:C5, 2]] do |notes|
    pl notes
  end
  sleep 4
  
  pl [:r, 1, [:F4, :Bb4], 0.5, [:D4, :G4], 0.5, [:F4, :Bb4], 0.5, [:D4, :G4], 0.5, [:C4, :F4], 0.5]
  pl [[:D4, :G4], 1, [:D4, :G4], 0.5, [:F4, :Bb4], 0.5, [:D4, :G4], 0.5, [:F4, :Bb4], 0.5, [:D4, :G4], 0.5, [:C4, :F4], 0.5, [:D4, :G4], 0.5]
  
  at [0, 1, 2], [[:C4, 4], [:G4, 3], [:E5, 2]] do |notes|
    pl notes
  end
  sleep 4
  at [0, 1, 2], [[:Ab3, 4], [:Eb4, 3], [:C5, 2]] do |notes|
    pl notes
  end
  sleep 4
end

define :bass do # 1.5 beats upbeat
  # upbeat
  pl [[:D2, :D3], 0.5, [:F2, :F3], 0.5, [:Fs2, :Fs3], 0.5]
  # start
  pl [[:G2, :G3], 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5]
  pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :G2, 0.5, :G3, 0.5, :F2, 0.5, :G3, 0.5]
  pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :C3, 0.5, :C4, 0.5, :C3, 0.5, :Bb3, 0.5]
  pl [:Bb2, 0.5, :G3, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5]
  # repeat
  pl [[:G2, :G3], 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5]
  pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :G2, 0.5, :G3, 0.5, :F2, 0.5, :G3, 0.5]
  pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :C3, 0.5, :C4, 0.5, :C3, 0.5, :Bb3, 0.5]
  pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5] * 2
  # verse
  2.times do
    pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5] * 2
  end
  pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :F2, 0.5, :F2, 0.5, :F3, 0.5, :F2, 0.5]
  3.times do
    3.times do
      pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5] * 2
    end
    pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :F2, 0.5, :F2, 0.5, :F3, 0.5, :F2, 0.5]
  end
  pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5] * 2
  # chorus
  pl [:C3, 0.5, :C4, 0.5] * 4
  pl [:Ab2, 0.5, :Ab3, 0.5] * 4
  2.times do
    pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5] * 2
  end
  pl [:C3, 0.5, :C4, 0.5] * 4
  pl [:Ab2, 0.5, :Ab3, 0.5] * 4
  # outro
  2.times do
    pl [[:G2, :G3], 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5]
    pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :G2, 0.5, :G3, 0.5, :F2, 0.5, :G3, 0.5]
    pl [:G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :C3, 0.5, :C4, 0.4, :C3, 0.5, :Bb3, 0.5]
    pl [:Bb2, 0.5, :G3, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5, :G2, 0.5, :G3, 0.5, :G2, 0.5]
  end
end

#### And the vocals

define :verse1 do # 16 bars, plus a half-beat upbeat
  puts "We all came down to Montreux"
  pl [:F5, 0.5, :G5, 1, :G5, 1, :F5, 1, :D5, 0.5, :F5, 1, :D5, 1.5, :r, 1]
  puts "On the Lake Geneva shoreline"
  pl [:C5, 0.5, :Bb4, 0.5, [:Db5, :C5], [0.25, 0.75], :Bb4, 0.5, :C5, 1.5, :D5, 0.5]
  pl [[:Bb4, :G4], [0.5, 0.5], :G4, 1, :r, 3]
  puts "To make records with the mobile"
  pl [:F5, 0.5, :F5, 1, :F5, 0.5, :D5, 0.5, :F5, 0.5, :D5, 0.5, :G5, 1, :D5, 1, :r, 4.5]
  puts "We didn't have much time"
  pl [:Db5, 0.5, :C5, 0.5, :Bb4, 0.5, :Db5, 0.5, :Db5, 1, :G4, 1, :r, 2.5]
  puts "Frank Zappa and the Mothers"
  pl [:G5, 1, :G5, 0.5, :F5, 0.5, :G5, 0.5, :F5, 0.5, :G5, 1, :G5, 1.5, :r, 1]
  puts "Were at the best place around"
  pl [:Bb4, 0.5, :C5, 0.5, :Bb4, 0.5, :Db5, 1, :C5, 1, [:Bb4, :D5, :Db5, :D5], [0.5, 0.125, 0.125, 1.25], :r, 3.25]
  puts "But some stupid with a flare gun"
  pl [:D5, 0.5, :F5, 1, :F5, 0.5, :D5, 0.5, :F5, 0.5, :D5, 0.5, :F5, 1, :G5, 1, :r, 2]
  puts "Burned the place to the ground"
  pl [:F5, 0.5, :D5, 0.5, :D5, 1, :C5, 0.5, :D5, 1, [:Bb4, :G4], [0.25, 1.25], :r, 3]
end

define :chorus do # 6 bars
  puts "Smoke on the water"
  pl [[:G4, :E5], 3, [:F4, :D5], 0.5, [:E4, :C5], 0.5, [:Gb4, :Eb5], 2, [:E4, :C5], 1.5, :r, 1]
  puts "And fire in the sky"
  pl [:G4, 0.5, [:Bb4, :G4], [0.5, 0.5], :Bb4, 0.5, :G4, 0.5, [:F4, :G4], [0.5, 0.5], :r, 4]
  puts "Smoke on the water"
  pl [[:G4, :E5], 3, [:F4, :D5], 0.5, [:E4, :C5], 0.5, [:Gb4, :Eb5], 2, [:E4, :C5], 1.5, :r, 0.5]
end

#### Now let's put it all together (only 1 verse):
# bar 0: start intro
# bar 8: drums start
# bar 16: bass starts, drums beat2
# bar 24: verse 1
# bar 40: chorus
# bar 46: outro
# bar 54: end

with_fx :reverb, room: 0.8, slide: 3 do |fx|
  
  at bar(0) do
    use_synth :fm
    with_fx :distortion, distort: 0.9 do
      6.times do
        lead_intro
      end
      sleep bar(22)
      2.times do
        lead_intro
      end
      
    end
  end
  
  at bar(8) do
    with_fx :level, amp: 1.5 do |f|
      8.times do
        beat1
      end
      control f, level: 3
      7.times do
        beat2
      end
      beat3
      4.times do
        beat4
      end
      14.times do
        beat2
      end
    end
  end
  
  at bar(16) - 1.5 do
    use_synth :fm
    use_synth_defaults cutoff: 70, amp: 1.5
    with_fx :distortion, distort: 0.7 do
      bass
    end
  end
  
  at bar(24) do
    use_synth :fm
    use_synth_defaults amp: 1.5
    lead_verse
    lead_chorus
  end
  
  at bar(24) - 0.5 do
    use_synth :fm
    use_synth_defaults depth: 2, slide: 0.02, amp: 1.5
    verse1
    chorus
  end
  
  at bar(53) do
    control fx, amp: 0
  end
  
end

#
