# Wonderwall - Oasis
# uses play_helper and guitar helpers

use_debug false
use_bpm 68

with_fx :reverb, room: 0.9 do
  
  at 16 do
    use_synth :fm
    use_synth_defaults attack: 0.05, slide: 0.025, depth: 1.5
    with_fx :distortion, amp: 0.5 do
      puts "Today is gonna be the day that they're"
      pl [:r, 0.5, :B4, 0.5, :A4, 0.75, :G4, 0.25, [:A4, :G4], [0.25, 0.25], :A4, 0.25, :G4, 0.25, :A4, 0.5, :A4, 0.25, :G4, 0.25]
      puts "gonna throw it back to you."
      pl [[:A4, :G4], [0.25, 0.25], :A4, 0.25, :G4, 0.25, :A4, 0.5, :B4, 0.25, :G4, 1.25, :r, 1]
      puts "By now you should've some how"
      pl [:r, 0.5, :B4, 0.5, :A4, 0.75, :G4, 0.25, :A4, 0.25, :G4, 0.25, :A4, 0.5, :A4, 0.5]
      puts "realised what you gotta do."
      pl [[:A4, :G4], [0.25, 0.25], :A4, 0.5, :A4, 0.25, :G4, 0.25, [:A4, :B4], [0.5, 0.25], :G4, 1.5, :r, 1]
      puts "I don't believe that anybody"
      pl [:B4, 0.25, :D5, 0.25, [:B4, :D5], [0.25, 0.75], :D5, 0.25, :E5, 0.75, :D5, 0.25, :A4, 0.5, :G4, 0.75]
      puts "feels the way I do"
      pl [:A4, 0.75, :A4, 0.25, [:A4, :B4], [0.25, 0.5], :G4, 1]
      puts "about you now"
      pl [:E4, 0.25, :E4, 0.5, :E4, 0.25, [:G4, :E4], [0.5, 1.75], :r, 5.5]
    end
  end
  
  use_synth :pluck
  use_synth_defaults coef: 0.35
  
  with_fx :lpf, cutoff: 110 do
    em7   = [40, 47, 52, 55, 62, 67]
    g     = [43, 47, 50, 55, 62, 67]
    dsus4 = [:r, :r, 50, 57, 62, 67]
    a7sus4= [:r, 45, 52, 55, 62, 67]
    5.times do
      strum em7,     'D.d.D.dU'
      strum g,       'dUD.D.du'
      strum dsus4,   'DUD.D.d'
      strum a7sus4, 'U.U.uduDu'
    end
    strum em7,     'D.d.D.dU'
    strum g,       'dUD.D.du'
    strum dsus4,   'DUD.D.d'
    strum a7sus4, 'U.U.uduD.'
  end
end
