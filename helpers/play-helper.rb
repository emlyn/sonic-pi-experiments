# Helper for playing tunes more easily.
# A bit like play_pattern_timed, but the durations are interspersed with the notes,
# so that it's easier to match the notes and durations, and it can also slide/slur between notes.

def pl(notes, sus: 0.5, rel: nil)
  rel ||= 1 - sus
  notes.each_slice(2) do |n,d|
    if d.respond_to?(:each) then # slur
      dtot = d.reduce(:+)
      synth = play n[0], sustain: sus * dtot, release: rel * dtot
      sleep d[0]
      d[1..-1].zip(n[1..-1]).each do |dd, nn|
        control synth, note: nn
        sleep dd
      end
    else
      play n, sustain: sus * d, release: rel * d
      sleep d
    end
  end
end
