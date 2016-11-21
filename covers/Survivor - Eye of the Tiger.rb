# Eye of the Tiger (intro) - Survivor

use_debug false
use_bpm 102

with_fx :reverb, room: 0.8, amp: 1 do
  
  at 0 do
    use_synth :pluck
    with_fx :compressor, lpf: 70, amp: 0.2, amp_slide: 6 do |fx|
      control fx, amp: 1
      176.times do
        amps = (ring 1, 0.5, 0.5, 0.5, 0.75, 0.5, 0.5, 0.5)
        play :C2, attack: 0.05, release: 0.4, amp: amps.tick
        sleep 0.25
      end
    end
  end
  
  at 6 do
    sample :drum_cymbal_open, beat_stretch: 10, rate: -1, amp: 2
  end
  
  live_loop :bam, auto_cue: false do
    sync :bam
    sample :bd_haus, amp: 2
  end
  
  at 16 do
    use_synth :fm
    use_synth_defaults amp: 2
    with_fx :distortion, distort: 0.6 do
      2.times do
        cue :bam # Trigger drum outside of the distortion fx
        play [:C4, :Eb4, :G4, :C5], release: 0.5
        sleep 2
        2.times do
          cue :bam
          play [:C4, :Eb4, :G4, :C5], release: 0.5
          sleep 0.75
          cue :bam
          play [:Bb3, :D4, :F4, :Bb4], release: 0.5
          sleep 0.75
          cue :bam
          play [:C4, :Eb4, :G4, :C5], release: 0.5
          sleep 2
        end
        cue :bam
        play [:C4, :Eb4, :G4, :C5], release: 0.5
        sleep 0.75
        cue :bam
        play [:G3, :Bb3, :Eb4, :G4], release: 0.5
        sleep 0.75
        cue :bam
        play [:Ab3, :C4, :Eb4, :Ab4], release: 4.5
        sleep 4.5
      end
    end
  end
end
