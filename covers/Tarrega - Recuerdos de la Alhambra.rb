define :trem do |n1, n2, acc=1|
  play n1, release: 0.5, amp: acc
  time_warp [0.125, 0.25, 0.375 + 0.02] do
    time_warp rrand(-0.01, 0.01) do
      play n2, release: 0.125, amp: 0.88
    end
  end
  sleep 0.5
end

define :trem2 do |n1, n2, n3|
  play n1, release: 0.5
  at 0.125 do
    play n2, release: 0.125, amp: 0.8
    sleep 0.125
    s = play n2, release: 0.25, slide: 0.02, amp: 0.8
    sleep 0.25/3
    control s, note: n3, amp: 1.5
    sleep 0.25/3
    control s, note: n2
  end
  sleep 0.5
end

define :bar do |thumbs, trems, acc=false|
  trems *= 2 if trems.length == 1
  trems = [trems[0]] + trems if trems.length == 2
  trems = stretch(trems, 2) if trems.length == 3
  assert_equal thumbs.length, trems.length
  thumbs.zip(trems).each_with_index do |n, i|
    n1, n2 = n
    a = 1
    a = 2 if acc and i > 0 and i % 2 == 0
    trem n1, n2, a
  end
end

define :part1 do |fx|
  # bar 1
  control fx, amp: 0.8
  bar [:a2, :e3, :c4, :e3, :b3, :e3], [:e4, :d4], true
  
  control fx, amp: 2
  bar [:a2, :e3, :c4, :e3, :b3, :e3], [:c4, :d4], true
  
  control fx, amp: 0.8
  bar [:a2, :e3, :c4, :e3, :c3, :e3], [:e4], true
  
  control fx, amp: 2
  bar [:a2, :e3, :c4, :e3, :d4, :e3], [:e4, :f4], true
  
  # bar 5
  bar [:c3, :g3, :e4, :g3, :d4, :g3], [:g4, :f4]
  
  bar [:c3, :g3, :c4, :g3, :d4, :g3], [:e4, :f4]
  
  bar [:c3, :g3, :e4, :g3, :e4, :g3], [:g4]
  
  bar [:c3, :g3, :c4, :g3, :e4, :g3], [:g4]
  
  # bar 9
  bar [:f3, :c4, :f4, :c4, :g4, :c4], [:c5, :b4]
  
  bar [:f3, :c4, :f4, :c4, :d3, :f4], [:a4, :b4]
  
  trem :e2, :a4
  trem2 :b3, :a4, :b4
  2.times do
    trem :e4, :gs4
    trem :b3, :gs4
  end
  
  bar [:e2, :d4, :e4, :d4, :e4, :d4], [:gs4]
  
  # bar 13
  bar [:a2, :cs4, :e4, :cs4, :e4, :cs4], [:bf4, :a4]
  
  bar [:cs3, :a3, :e4, :a3, :f4, :a3], [:g4, :a4]
  
  trem :d3, :g4
  trem2 :e4, :g4, :a4
  2.times do
    trem :d4, :f4
    trem :a3, :f4
  end
  
  bar [:d3, :a3, :d4, :a3, :d4, :a3], [:f4]
  
  # bar 17
  bar [:d3, :a3, :b3, :a3, :b3, :a3], [:e4, :d4]
  
  bar [:f2, :ds3, :a3, :ds3, :a3, :ds3], [:c4, :d4]
  
  trem :e2, :c4
  trem2 :e3, :c4, :d4
  2.times do
    trem :gs3, :b3
    trem :e3, :b3
  end
  
  bar [:e2, :e3, :gs3, :e3, :gs3, :e3], [:b3]
end

define :part2 do |fx, n|
  # bar 21
  bar [:a2, :e3, :cs4, :e3, :b3, :e3], [:e4, :d4]
  
  bar [:a2, :e3, :a3, :e3, :b3, :e3], [:cs4, :d4]
  
  2.times do
    bar [:a2, :e3, :cs4, :e3, :cs4, :e3], [:e4]
  end
  
  #bar 25
  bar [:a2, :fs3, :d4, :fs3, :d4, :fs3], [:fs4]
  
  bar [:a2, :d4, :b4, :d4, :d4, :fs3], [:d5, :fs4]
  
  trem :a2, :fs4
  trem2 :d4, :fs4, :gs4
  2.times do
    trem :cs4, :e4
    trem :e3, :e4
  end
  
  bar [:a2, :e3, :cs4, :e3, :cs4, :e3], [:e4]
  
  # bar 29
  bar [:fs2, :fs3, :a3, :cs4, :a3, :fs3], [:a4]
  
  bar [:e2, :gs3, :bs3, :ds4, :bs3, :gs3], [:gs4, :ds3]
  
  bar [:cs3, :gs3, :cs4, :gs3, :cs4, :gs3], [:fs4, :e4, :e4]
  
  bar [:cs3, :gs3, :cs4, :gs3, :cs4, :gs3], [:e4]
  
  # bar 33
  bar [:b2, :f3, :f3, :d3, :e3, :f3], [:d4]
  
  bar [:e2, :e3, :e3, :e3, :e2, :d3], [:cs4, :b3]
  
  trem :a2, :b3
  trem2 :e3, :b3, :cs3
  trem :e3, :a3
  trem :e3, :a3
  trem :fs3, :a3
  trem :gs3, :a3
  
  if n == 1 then
    bar [:a2, :e3, :cs3, :e3, :a3, :b3], [:a3, :a3, :a3, :b3, :cs4, :d4]
  elsif n == 2 then
    bar [:a2, :e3, :e3, :gs3, :a3, :b3], [:a3, :a3, :a3, :b3, :c4, :d4]
  elsif n == 3 then
    bar [:a2, :e3, :e3, :e3, :e3, :e3], [:a3]
  else
    assert false
  end
end

define :coda do |fx|
  # bar 39
  bar [:a2, :f3, :f3, :f3, :f3, :f3], [:a3]
  
  bar [:a2, :f3, :a3, :f3, :a3, :f3], [:b3, :c4, :d4]
  
  2.times do
    bar [:a2, :e3, :cs4, :e3, :cs4, :e3], [:e4]
  end
  
  # bar 43
  bar [:e2, :gs3, :gs3, :gs3, :gs3, :gs3], [:e4]
  
  bar [:e2, :fs3, :e3, :e3, :e2, :d3], [:d4, :cs4, :b4]
  
  bar [:a2, :e3, :e3, :es3, :fs3, :es3], [:a3]
  
  bar [:a2, :e3, :e3, :e3, :e3, :e3], [:a3]
  
  # bar 47
  bar [:a2, :f3, :f3, :f3, :f3, :f3], [:a3]
  
  bar [:a2, :f3, :a3, :f3, :a3, :f3], [:b3, :c4, :d4]
  
  2.times do
    bar [:a2, :e3, :cs4, :e3, :cs4, :e3], [:e4]
  end
  
  # bar 51
  bar [:e2, :e3, :e4, :e3, :e4, :e3], [:gs4]
  
  bar [:e2, :e3, :cs4, :e3, :b3, :e3], [:fs4, :e4, :d4]
  
  bar [:a2, :e3, :a3, :e3, :fs3, :a3], [:cs4]
  
  trem :a2, :cs4
  use_bpm_mul 0.98
  trem :e3, :cs4
  use_bpm_mul 0.98
  trem :a3, :cs4
  use_bpm_mul 0.98
  trem :e2, :cs4
  use_bpm_mul 0.98
  trem :bs2, :cs4
  use_bpm_mul 0.98
  trem :cs3, :cs4
  use_bpm_mul 0.98
  
  # bar 55
  control fx, amp: 1, slide: 1
  bar [:a2, :e3, :a3, :e2, :bs2, :cs3], [:cs4]
  
  control fx, amp: 0.5, slide: 0.5
  play :a2, release: 3
  sleep 0.5
  [:e3, :a3, :cs4, :e4, :a4].each do |n|
    play n, release: 1
    sleep 0.5
  end
  
  time_warp line(0, 0.5), [:a2, :cs4, :a4, :e5] do |n|
    play n, release: 3
  end
  sleep 3
  
  time_warp line(0, 0.5), [:a2, :cs3, :e4, :a4] do |n|
    play n, release: 3
  end
  sleep 3
  
end

use_synth :pluck
use_synth_defaults attack: 0.05
use_bpm 82

with_fx :reverb, room: 1, amp: 2, slide: 3 do |fx|
  2.times do
    part1 fx
  end
  2.times do |n|
    part2 fx, n+1
  end
  part1 fx
  part2 fx, 3
  coda fx
end