# Before running this file, first run helpers/guitar.rb to load the guitar and strum functions

use_debug false
use_bpm 120

live_loop :guit do
  #chords = ring((guitar :d, :m7), (guitar :g, '7'), (guitar :c, :M7), (guitar :f, :M7),
  #              (guitar :b, :m7), (guitar :e, '7'), (guitar :a, :m7))
  chords = ring((guitar :a, :m), (guitar :c, :M), (guitar :d, :M), (ring :r, :r, 53, 57, 60, 65),
                (guitar :a, :m), (guitar :c, :M), (guitar :e, :M), (guitar :e, '7'))
  with_fx :reverb do
    with_fx :lpf, cutoff: 115 do
      with_synth :pluck do
        tick
        "D.DU.UDU".split(//).each do |s|
          if s == 'D' # Down stroke
            strum chords.look, t: 0.05
          elsif s == 'U' # Up stroke
            with_fx :level, amp: 0.5 do
              strum chords.look.reverse, t: 0.03
            end
          end
          sleep 0.5
        end
      end
    end
  end
end
