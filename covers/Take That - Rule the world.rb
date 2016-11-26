use_debug false
use_bpm 82

define :pls do |notes, sus=1|
  pl notes, sus
end

at 0 do
  # vocals
  use_synth :fm
  use_synth_defaults attack: 0.0625, slide: 0.0625, depth: 1.5
  with_fx :reverb do
    puts "You light"
    pl [:Fs3,  0.5, :B3, 3.5]
    puts "the skies"
    pl [:Fs3, 0.5, :Cs4, 2.5]
    puts "up above me;"
    pl [:Fs3, 1, :A3, 0.5, [:Fs3, :E3], [0.125, 0.875], :E3, 1.5, :r, 5.5]
    puts "a star"
    pl [:Fs3, 0.5, :B3, 3.5]
    puts "so bright"
    pl [:D4, 0.5, :E4, 3.5]
    puts "you blind me,"
    pl [:D4, 0.5, [:Cs4, :B3], [0.1875, 0.8125], :B3, 3]
    puts "yeah, yeah."
    pl [[:A3, :B3, :Fs3], [0.325, 0.175, 2], :r, 1]
    puts "Don't close"
    pl [:B3, 0.5, :E4, 3.5]
    puts "your eyes;"
    pl [:B3, 0.5, :D4, 2]
    puts "don't fade away,"
    pl [:B3, 0.5, [:G4, :Fs4], [0.5, 0.5], :Fs4, 0.5, :Cs4, 2]
    puts "don't fade away,"
    pl [:B3, 0.5, [:G4, :Fs4], [0.5, 0.5], :Fs4, 0.5, :E4, 1.5, :r, 0.5]
    puts "oh."
    pl [[:G4, :Fs4], [1, 1.5], :r, 0.5]
    puts "Yeah, you and me, we can ride on a star;"
    pl [:Fs4, 0.5]*6 + [:Fs4, 1, :G4, 0.5, :Fs4, 0.5, :Cs4, 1]
    puts "if you stay with me, girl,"
    pl [:Cs4, 0.5, :Cs4, 0.5, :Cs4, 1, :D, 0.5, :Cs4, 0.5, :B3, 1]
    puts "we can rule the world."
    pl [:Fs4, 0.5, :Fs4, 0.5, [:Fs4, :E4], [0.5, 0.5], :E4, 1]
    pl [[:G4, :Fs4], [1, 0.5], :r, 1.5], 0.8
    puts "Yeah, you and me, we can light up the sky;"
    pl [:Fs4, 0.5]*6 + [:Fs4, 1, :G4, 0.5, :Fs4, 0.5, :Cs4, 1]
    puts "if you stay by my side,"
    pl [:Cs4, 0.5, :Cs4, 0.5, :Cs4, 1, :D, 0.5, :Cs4, 0.5, :B3, 1]
    puts "we can rule the world."
    pl [:Fs4, 0.5, :Fs4, 0.5, [:Fs4, :E4], [0.5, 0.5], :E4, 1]
    pl [[:G4, :Fs4], [1, 0.5]], 0.8
  end
end

at 1 do
  # left hand
  use_synth :piano
  #use_synth_defaults pan: -1
  with_fx :reverb do
    pls [:B2, 4, :Fs2, 4, :E2, 4, :Fs2, 4, :B2, 4, :Fs2, 4, :E2, 4, :Fs2, 4]
    pls [:E2, 3, :Fs2, 1, :B1, 2, :B1, 1, :Cs2, 1]
    with_fx :level, amp: 0.4 do
      pls [:Fs1, 0.5]*8 + [:A1, 0.5]*8 + [:D2, 0.5]*8
      pls [:B1, 0.5]*3 + [:Fs1, 1] + [:Fs1, 0.5]*6 + [:G1, 1]
      pls [:G1, 0.5]*6 + [:A1, 1] + [:A1, 0.5]*3 + [:D2, 0.5]*8
    end
  end
end

at 1 do
  # right hand
  use_synth :piano
  use_synth_defaults sustain: 1
  with_fx :reverb do
    2.times do
      # Bsus2/Bm
      play_pattern [[:Fs3, :Cs4], [:Fs3, :D4], [:Fs3, :Cs4], [:Fs3, :D4]]
      # F#m
      play_pattern [[:Cs4, :G4],  [:A3, :Fs4], [:Fs3, :Cs4], [:Cs3, :A3]]
      # Em
      play_pattern [[:E3, :B3],   [:B2, :G4],  [:E3, :B3],   [:B2, :G3]]
      # F#m
      play_pattern [[:Fs3, :Cs4], [:D3, :B3],  [:Fs3, :Cs4], [:D3, :B3]]
    end
    # Em
    play_pattern [[:E3, :B3],   [:B2, :G4],  [:E3, :B3],   [:B2, :G3]]
    # Bm
    play_pattern [[:Fs3, :D4],  [:D3, :B3],  [:Fs3, :D4],  [:D3, :B3]]
    # F#m (2)
    play_pattern [[:Fs3, :Cs4], [:Cs3, :A3], [:Fs3, :Cs4], [:Cs3, :A3]]
    # A
    play_pattern [[:E3, :Cs4],  [:Cs3, :A3], [:E3, :Cs4],  [:Cs3, :A3]]
    2.times do
      # D
      play_pattern [chord(:D3, :M)]*4
      # Bm/F#m
      play  chord(:B3, :m)
      sleep 1
      play  chord(:B3, :m), sustain: 0.5
      sleep 0.5
      play  chord(:Fs3, :m), sustain: 1.5
      sleep 1.5
      play  chord(:Fs3, :m)
      sleep 1
      # F#m/G
      play  chord(:Fs3, :m)
      sleep 1
      play  chord(:Fs3, :m), sustain: 0.5
      sleep 0.5
      play  chord(:G3, :M), sustain: 1.5
      sleep 1.5
      play  chord(:G3, :M)
      sleep 1
      # G/A
      play  chord(:G3, :M)
      sleep 1
      play  chord(:G3, :M), sustain: 0.5
      sleep 0.5
      play  chord(:A3, :M), sustain: 1.5
      sleep 1.5
      play  chord(:A3, :M)
      sleep 1
    end
  end
end

#
