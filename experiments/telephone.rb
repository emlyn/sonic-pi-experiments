# https://en.wikipedia.org/wiki/Dial_tone
# https://help.genesys.com/cic/mergedprojects/wh_ia/desktop/dial_tone,_busy_and_ringback_signals_by_country.htm
DIAL_TONES = {
  :uk => [350, 450],
  :us => [350, 440],
  :eu => [425],
  :jp => [400]
}

# http://dialabc.com/sound/dtmf.html
DTMF_TONES = {
  '1' => [697, 1209],
  '2' => [697, 1336],
  '3' => [697, 1477],
  '4' => [770, 1209],
  '5' => [770, 1336],
  '6' => [770, 1477],
  '7' => [852, 1209],
  '8' => [852, 1336],
  '9' => [852, 1477],
  '*' => [941, 1209],
  '0' => [941, 1336],
  '#' => [941, 1477],
  'A' => [697, 1477],
  'B' => [770, 1477],
  'C' => [852, 1477],
  'D' => [941, 1477],
}

# also
# http://www.telephonesuk.co.uk/sounds.htm

define :pulses do |freqs, periods|
  on = true
  periods.each do |t|
    if on
      freqs.each do |freq|
        synth :sine, note: hz_to_midi(freq), sustain: t, release: 0
      end
    end
    sleep t
    on = not(on)
  end
end

define :dialtone do |tone=:uk, periods=[2]|
  tone = DIAL_TONES[tone]
  pulses(tone, periods)
end

define :dtmf do |digit, length=0.15, pause=0.15|
  tone = DTMF_TONES[digit.to_s.upcase]
  pulses(tone, [length, pause]) if tone
end

define :ringring do |rings=1|
  pulses([400, 450], [0.4, 0.2, 0.4, 2] * rings)
end

define :phone do |number|
  with_fx :distortion, distort: 0.3, mix: 0.3 do
    noise = synth :pnoise, amp: 0.03, sustain: 15
    dialtone(:uk)
    number.split('').each do |n|
      dtmf(n)
    end
    sleep 1
    ringring(3)
    #control noise, amp: 0
  end
end

phone '01632 867 5309'
