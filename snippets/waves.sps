# key: waves
# point_line: 8
# point_index: 0
# --
with_fx :reverb, room: 0.95, mix: 0.5, lpf: 120, amp: 1, slide: 2 do |fx|
  live_loop :waves, auto_cue: false do
    synth [:bnoise, :cnoise, :gnoise].choose, amp: rrand(0.5, 1.5), attack: rrand(0.5, 4),
      decay: rrand(0.5, 4), sustain: rrand(0, 2), cutoff: rrand(60, 110), slide: rrand(1,3)
    control pan: rrand(-1,1), cutoff: rrand(60, 110)
    sleep rrand(2,4)
  end
end

