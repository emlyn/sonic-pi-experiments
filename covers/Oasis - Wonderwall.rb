# -*- mode: ruby; -*-

#use_debug false
use_bpm 68


define :strumbar do |chord, pattern, t = 0.25, dt = 0.025|
  pattern.split(//).each do |p|
    case p
    when 'D'
      with_fx :level, amp: 1 do
        strum chord, dt * 0.9
      end
    when 'd'
      with_fx :level, amp: 0.7 do
        strum chord, dt
      end
    when 'U'
      with_fx :level, amp: 0.8 do
        strum chord.reverse, dt*0.8
      end
    when 'u'
      with_fx :level, amp: 0.6 do
        strum chord.reverse, dt
      end
    else
      # nothing
    end
    sleep t
  end
end


live_loop :wall do
  em7   = (ring 40, 47, 52, 55, 62, 67)
  g     = (ring 43, 47, 50, 55, 62, 67)
  dsus4 = (ring :r, :r, 50, 57, 62, 67)
  a7sus4= (ring :r, 45, 52, 55, 62, 67)
  use_synth :pluck
  use_synth_defaults coef: 0.35
  use_debug false
  with_fx :reverb, room: 0.9 do
    with_fx :lpf, cutoff: 110 do
      strumbar em7,    'D.d.D.dU'
      strumbar g,      'dUD.D.du'
      strumbar dsus4,  'DUD.D.d'
      strumbar a7sus4,'U.U.uduDu'
    end
  end
end