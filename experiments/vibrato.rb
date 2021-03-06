use_debug false

live_loop :vib do
  n = chord(:e4, :minor7, num_octaves: 2).pick
  s = synth :sine, note: n, attack: 2, release: 6
  at do
    t0=vt
    x = 40
    while s.live?
      control s, note: n + Math.sin((vt-t0)*x) * 0.5 * Math.exp(0.2*(t0-vt)), note_slide: 1.0/32
      sleep 1.0/32
      x *= 0.9985
    end
  end
  sleep rrand(1,6)
end
