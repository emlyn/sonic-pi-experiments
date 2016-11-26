# Adjust the random seeds to modify the loops as it's running

use_debug false

with_fx :reverb, room: 0.9 do
  
  live_loop :tab do
    use_random_seed 2
    16.times do
      sample "tabla_", pick, amp: 1.5-(tick % 2)
      sleep 0.25
    end
  end
  
  live_loop :guit, sync: :tab do
    sample "guit", pick
    sleep 4
  end
  
  live_loop :bd, sync: :tab do
    use_random_seed 7
    sleep 0.25
    8.times do
      sample "bd", pick, amp: 2
      sleep 0.5
    end
  end
  
  live_loop :bass, sync: :tab do
    use_random_seed 77
    4.times do
      sample "bass", pick, release: 4, amp: 1
      sleep 1
    end
  end
  
  live_loop :ambi, sync: :tab do
    use_random_seed 0
    2.times do
      sample "ambi", pick, release: 4, amp: 3
      sleep 2
    end
  end
  
  live_loop :elec, sync: :tab do
    use_random_seed 6
    4.times do
      sample "elec", pick, release: 4, amp: 1
      sleep 1
    end
  end
  
end
