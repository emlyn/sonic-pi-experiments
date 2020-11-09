use_bpm 176

define :s do |t|
  sleep t
end

define :p do |n, r, a=1|
  if (n.respond_to? :each) then
    n.each do |i|
      play i, release: r, amp: a
    end
  else
    play n, release: r, amp: a
  end
end

define :c do |s, n|
  control s, note: n, amp: 2, slide: 0.1
end

define :ride do |t|
  sample :drum_cymbal_soft, release: t, amp: 0.5
  sleep t
end

define :sn do |t|
  sample :tabla_te_ne, release: t, amp: 0.5
  sleep t
end

define :hi do |t|
  sample :drum_cymbal_closed, release: t, amp: 0.3
  sleep t
end

with_fx :reverb, room: 0.95 do
  in_thread do # drums
    s 0.5
    # bar 1
    s 4
    # bar 2
    s 2.5
    ride 1.5
    # bar 3
    s 0.5
    ride 1
    ride 0.5
    s 0.5
    ride 1.5
    # bar 4
    s 1
    ride 2
    ride 1
    # bar 5
    ride 1.5
    ride 0.5
    s 1.5
    ride 0.5
    # bar 6
    s 1.5
    ride 0.5
    ride 2
    # bar 7
    ride 1.5
    ride 0.5
    s 0.5
    ride 0.5
    ride 0.5
    sn 0.5
    # bar 8
    s 3
    hi 1
    16.times do
      at [1, 3] do
        sn 1
      end
      8.times do
        hi 0.5
      end
    end

    s 0.5

    ## Bridge
    8.times do
      at [1, 3] do
        sn 1
      end
      8.times do
        hi 0.5
      end
    end

    with_fx :level, amp: 2 do
    hi 0.5
    hi 0.5
    s 0.5
    hi 0.5
    s 0.5
    hi 1
    in_thread do
      hi 1
    end
    s 0.5
    end

    at [1, 3] do
      sn 1
    end
    s 0.5
    7.times do
      hi 0.5
    end

    9.times do
      at [1, 3] do
        sn 1
      end
      8.times do
        hi 0.5
      end
    end

    with_fx :level, amp: 1 do |fx|
      control fx, amp: 0.2, slide: 4
      at [1, 3] do
        sn 1
      end
      8.times do
        hi 0.5
      end
    end

    s 1
    ride 2
  end

  in_thread do # guitar
    use_synth :pluck
    use_synth_defaults pan: 0.5, attack: 0.05
    # Intro
    p :a2, 1.5
    s 0.5
    # bar 1
    p [:a3, :cs4], 1.5
    s 1
    p :a2, 2.5
    s 0.5
    p [:gs3, :b3], 1
    s 1
    p :b3, 1, 0.5
    p :e4, 1
    s 1
    p :a2, 2
    p [:a2, :cs4], 1
    s 1
    p [:cs4, :e4], 1.5
    s 1
    p :a2, 1.5
    s 0.5
    p [:gs3, :b3], 2
    s 1
    p :e2, 0.5, 0.5
    s 0.5
    p :e2, 0.5, 0.5
    s 0.5
    # bar 3
    2.times do
      p :a2, 1.5
      p [:a3, :cs4], 1
      s 1
      p :cs4, 0.5, 0.5
      p :e4, 0.5
      s 0.5
      p :a2, 2
      p [:gs3, :b3], 1
      s 1
      p :b3, 1, 0.5
      p :e4, 1
      s 1
      p :a2, 2
      p [:a3, :cs4], 1
      s 1
      p [:cs4, :e4], 1.5
      s 1
      p :a2, 2.5
      s 0.5
      p [:gs3, :b3], 2
      s 2
      # bar 5/7
    end
    p :a2, 1.5
    p [:a3, :cs4], 1
    s 1
    p :cs4, 0.5, 0.5
    p :e4, 0.5
    s 0.5
    p :a2, 2
    p [:gs3, :b3], 1
    s 1
    p :b3, 1, 0.5
    p :e4, 1
    s 1
    p [:a2, :a3, :cs4], 0.5
    p :e3, 0.5, 0.5
    s 0.5
    # bar 8
    s 1.5
    p :e3, 0.5
    s 0.5
    x = p :gs3, 1
    s 0.5
    c x, :a3
    s 0.5
    p :b3, 0.5
    s 0.5
    p [:a2, :gs3, :cs4], 2
    p :gs3, 1, 0.5
    s 1 #bar 9
    p [:cs4, :e4], 1
    s 1
    p :a2, 2
    s 0.5
    p :fs3, 0.3, 0.5
    p [:b3, :ds4], 0.5
    s 0.5
    p :e4, 1
    s 1
    p :gs2, 2
    p [:b3, :e4], 1
    s 1 # bar 10
    p [:e4, :gs4], 1
    s 1
    p :fs2, 2
    x = p :a3, 1
    s 0.5
    c x, :as3
    s 0.5
    p :cs4, 1
    s 1
    p [:b2, :a3, :d4], 2
    p :fs3, 1, 0.5
    s 1 # bar 11
    p [:d4, :fs4], 1
    s 1
    p :b2, 2
    s 0.5
    p :a3, 1.5
    x = p :d4, 1.5
    s 0.5
    c x, :cs4
    s 1
    p [:e2, :gs3, :b3], 2
    p :e3, 1, 0.5
    s 1 # bar 12
    p [:b3, :e3], 1
    s 1
    p :e2, 2
    s 0.5
    x = p :d4, 1
    s 0.5
    c x, :cs4
    s 0.5
    p :b3, 0.5
    s 0.5
    p [:a2, :a3, :cs4], 2
    p :e3, 1, 0.5
    s 1 # bar 13
    p :cs4, 1, 0.5
    p :e4, 1
    s 1
    p :a2, 2
    s 0.5
    x = p :cs4, 1
    s 0.5
    c x, :b3
    s 0.5
    p :a3, 0.5, 0.5
    x = p :a3, 1.5
    s 0.5
    c x, :as3
    p [:fs2, :e3], 2
    s 1 # bar 14
    p [:cs4, :fs4], 1
    s 1
    p :a3, 2
    s 0.5
    x = p :as3, 1
    s 0.5
    c x, :b3
    s 0.5
    p :cs4, 0.5
    s 0.5
    p :b2, 2
    p :fs3, 1, 0.5
    p [:a4, :d4], 1
    s 1 # bar 15
    p [:d4, :fs4], 1
    s 1
    p :b2, 2
    s 0.5
    p :a3, 1.5
    x = p :d4, 1.5
    s 0.5
    c x, :cs4
    s 0.5
    x = p :g3, 1.5
    s 0.5
    c x, :gs3
    p :e2, 2
    p :e3, 1, 0.5
    p :b3, 1
    s 1 # bar 16
    p [:b3, :e4], 1
    s 1
    2.times do
      p :a2, 2
      s 0.5
      p :b3, 0.5
      s 0.5
      x = p :a3, 1
      s 0.5
      c x, :gs3
      s 0.5
      p :a2, 2
      p :e3, 1, 0.5
      p [:a3, :cs4], 1
      s 1 # bar 17/21
      p [:cs4, :e4], 1
      s 1
      p :a2, 2
      s 0.5
      p [:a3, :cs4], 0.5
      s 0.5
      p [:cs4, :e4], 1
      s 1
      p :fs2, 2
      p [:a3, :d4], 1
      s 1 # bar 18/22
      p [:d4, :e4], 1
      s 1
      p :fs2, 2
      s 0.5
      p [:a4, :d4], 0.5
      s 0.5
      p [:d4, :e4], 1
      s 1
      p :e2, 2
      p [:a4, :d4], 1
      s 1 # bar 19/23
      p [:d4, :e4], 1
      s 1
      p :e2, 2
      s 0.5
      p [:a4, :d4], 0.5
      s 0.5
      p [:d4, :e4], 1
      s 1
      p :e2, 2
      p [:gs3, :d4], 1
      s 1 # bar 20/24
      p [:d4, :e4], 1
      s 1
    end
    p :e2, 2
    s 0.5
    x = p :gs3, 0.5
    s 0.5
    c x, :a3
    s 0.5
    p :b3, 0.5
    s 0.5
    p [:a2, :a3, :cs3], 0.5
    p :e3, 0.5, 0.5
    s 0.5

    s 0.5

    # Bridge
    puts "b1", beat
    p :cs3, 1
    x = p :fs3, 1
    p :b3, 1
    y = p :ds4, 1
    s 0.5
    c x, :gs3
    c y, :e4
    s 1
    p [:cs3, :gs3, :b3, :e4], 0.5
    s 1
    p [:cs3, :gs3, :b3, :e4], 0.5
    s 1
    p :fs2, 2
    p :cs3, 1.5, 0.5
    p [:e3, :a3, :cs4], 1.5
    s 1.5 # bar 2
    p :e3, 1, 0.5
    p [:a3, :cs4], 1
    s 0.5
    p :fs2, 1.5
    s 0.5
    p :e3, 0.5, 0.5
    p [:a3, :cs4], 0.5
    s 0.5
    p [:cs4, :fs4], 0.5
    s 1
    p :b2, 2
    p [:fs3, :a3, :d4], 1
    s 0.5
    puts "b3", beat
    # bar 3
    s 0.5
    p [:d4, :fs4], 1.5
    s 1
    p :b2, 2
    s 0.5
    p :a3, 1.5
    x = p :d4, 1.5
    s 0.5
    c x, :cs4
    s 1
    p :e2, 2
    p :e3, 1, 0.5
    p [:gs3, :b3], 1
    s 1 # bar 4
    p [:b3, :e4], 1
    s 1
    p :e3, 1.5
    s 0.5
    x = p :gs3, 1
    s 0.5
    c x, :a3
    s 0.5
    p :b3, 0.5
    s 1
    puts "b5", beat
    # bar 5
    p :cs3, 1
    x = p :fs3, 1
    p :b3, 1
    y = p :ds4, 1
    s 0.5
    c x, :gs3
    c y, :e4
    s 1
    p [:cs3, :gs3, :b3, :e4], 0.5
    s 1
    p [:cs3, :gs3, :b3, :e4], 0.5
    s 1
    p :fs2, 2
    p :cs3, 1, 0.5
    p [:e3, :a3, :cs4], 1
    s 0.5
    # bar 6
    puts "b6", beat
    s 0.5
    p [:cs4, :fs4], 1
    s 1
    p :fs2, 2
    s 0.5
    p :e3, 0.5, 0.5
    p [:a3, :cs4], 0.5
    s 0.5
    p [:a3, :cs4], 0.5
    s 1
    p :b2, 2
    p :fs3, 1, 0.5
    p [:a3, :d4], 1
    s 0.5
    # bar 7
    puts "b7", beat
    s 0.5
    p [:d4, :fs4], 1
    s 1
    p :b2, 1.5
    s 0.5
    p :fs3, 0.5, 0.5
    p :a3, 1
    x = p :d4, 1
    s 0.5
    c x, :cs4
    s 1
    p :e2, 2
    p :e3, 1, 0.5
    p [:gs3, :b3], 1
    s 0.5
    # bar 8
    puts "b8", beat
    s 0.5
    p [:b3, :e4], 1
    s 1
    p :e3, 1.5
    s 0.5
    x = p :gs3, 1
    s 0.5
    c x, :a3
    s 0.5
    p :b3, 0.5
    s 1
    puts "b9", beat
    # bar 9
    s 0.5
    p [:cs3, :b3, :e4, :gs4], 0.5
    p :gs3, 0.5, 0.5
    s 1
    p [:cs3, :b3, :e4, :gs4], 0.5
    p :gs3, 0.5, 0.5
    s 1
    p [:cs3, :b3, :e4, :gs4], 0.5
    p :gs3, 0.5, 0.5
    s 1
    p :fs2, 2
    p :cs3, 1, 0.5
    p [:e3, :a3, :cs4], 1
    s 0.5
    # bar 10
    puts "b10", beat
    s 0.5
    with_synth_defaults coef: 0.7 do
      p :cs4, 1
      p :fs4, 1
      s 1
    end
    p :fs2, 1.5
    s 0.5
    p :e3, 0.5, 0.5
    p [:a3, :cs4], 0.5
    s 0.5
    p :fs4, 0.5
    s 1
    p :b2, 2
    p :fs3, 1
    p [:a3, :d4], 1
    s 1 # bar 11
    p [:d4, :fs4], 1
    s 1
    p :b2, 2
    s 0.5
    p :a3, 1
    x = p :d4, 1
    s 0.5
    c x, :cs4
    s 1
    p :e2, 2
    p :e3, 1, 0.5
    p [:gs3, :b3], 1
    s 0.5
    # bar 12
    puts "b12", beat
    s 0.5
    p [:b3, :e4], 1
    s 1
    p :e2, 2
    s 0.5
    p :b3, 0.5
    s 0.5
    x = p :a3, 1
    s 0.5
    c x, :gs3
    s 0.5
    p :a2, 2
    p :e3, 1, 0.5
    p [:a3, :cs4], 1
    s 1 # bar 13
    p :cs4, 1, 0.5
    p :e4, 1
    s 1
    p :a2, 2
    s 0.5
    p [:a3, :cs4], 0.5
    p :cs4, 0.5
    s 0.5
    p :e4, 1
    s 1
    p :fs2, 2
    p [:a3, :d4], 1
    s 1 # bar 14
    p [:d4, :e4], 1
    s 1
    p :fs2, 2
    s 0.5
    p [:a4, :d4], 0.5
    s 0.5
    p [:d4, :e4], 1
    s 1
    p :e2, 2
    p [:a4, :d4], 1
    s 0.5
    # bar 15
    puts "b15", beat
    s 0.5
    p [:d4, :e4], 1
    s 1
    p :e2, 2
    s 0.5
    p [:a4, :d4], 0.5
    s 0.5
    p [:d4, :e4], 1
    s 1
    p :e2, 2
    p [:gs3, :d4], 1
    s 0.5
    # bar 16
    puts "b16", beat
    s 0.5
    p [:d4, :e4], 1
    s 1
    p :e3, 1.5
    s 0.5
    p :b3, 0.5
    s 0.5
    x = p :a3, 1
    s 0.5
    c x, :gs3
    s 0.5
    p :a2, 2
    p :e3, 1, 0.5
    p :a3, 1
    p :cs4, 1, 0.5
    s 1 # bar 17
    p :cs4, 1, 0.5
    p :e4, 1
    s 1
    p :a2, 2
    s 0.5
    p [:a3, :cs4], 0.5
    s 0.5
    p :cs4, 1, 0.5
    p :e4, 1
    s 1
    p :fs2, 2
    p [:a3, :d4], 1
    s 0.5
    # bar 18
    puts "b18", beat
    s 0.5
    p [:d4, :e4], 1
    s 1
    p :fs2, 2
    s 0.5
    p [:a4, :d4], 0.5
    s 0.5
    p [:d4, :e4], 1
    s 1
    p :e2, 2
    p [:a4, :d4], 1
    s 1 # bar 19
    p [:d4, :e4], 1
    s 1
    p :e2, 2
    s 0.5
    p [:a4, :d4], 0.5
    s 0.5
    p [:d4, :e4], 1
    s 1
    p :e2, 2
    p [:gs3, :d4], 1
    s 0.5
    # bar 20
    puts "b20", beat
    s 0.5
    p [:d4, :e4], 1
    s 1
    p :e2, 1
    s 0.5
    x = p :b3, 1
    s 0.5
    c x, :a3
    s 0.5
    p :gs3, 0.5
    s 2
    p :a2, 2
    s 0.2
    p :e3, 2, 0.5
    s 0.2
    p :a3, 2
    s 0.2
    p :cs4, 2
    s 0.2
    p :a4, 2
  end
end