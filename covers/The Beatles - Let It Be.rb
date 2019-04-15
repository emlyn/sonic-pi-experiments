# Let it be - The Beatles (guitar)
# Uses the guitar helper

use_bpm 72
use_synth :pluck

chords = [
  guitar(:c), 'D.du',
  guitar(:g), 'D.du',
  guitar(:a, :m), 'D.',
  guitar(:a, :m7), 'du',
  guitar(:f), 'D.du',
  guitar(:c), 'D.du',
  guitar(:g), 'D.du',
  guitar(:f), 'D.',
  [:e3, :g3], 'd',
  [:d3, :g3], 'd',
  guitar(:c), 'D...',
] * 2

with_fx :reverb, room: 1 do
  with_fx :lpf, cutoff: 95 do
    chords.each_slice(2) do |ch, p|
      strum(ch, pattern: p, t: 0.5)
    end
  end
end
