# key: waves
# point_line: 11
# point_index: 0
# --
with_fx :reverb, room: 0.95, mix: 0.5, lpf: 120, amp: 1, slide: 2 do |fx|
  live_loop :waves, auto_cue: false do
    use_debug false
    a = 1
    s = [:noise, :pnoise, :gnoise, :bnoise, :cnoise].choose
    synth s, amp: rrand(a/4.0, a), cutoff: rrand(60, 110), pan: rrand(-1,1), slide: rrand(1,3),
      attack: rrand(0.5, 3), decay: rrand(0.5, 4), sustain: rrand(0, 2), release: rrand(0.5, 2)
    control pan: rrand(-1,1), cutoff: rrand(60, 110)
    sleep rrand(2,4)
  end
end

