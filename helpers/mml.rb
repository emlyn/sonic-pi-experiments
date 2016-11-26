# Attempt at a MML parser and player in Sonic Pi

define :mml do |txt, vol_scale=100|
  octave = 5
  length = 4
  use_bpm 120
  txt = txt.downcase.gsub(/^mml@| |;$/, '').gsub(/#/, '+').gsub(/w/, 'r')
  while not txt.empty?
    r = txt.scan(/^(.)([+-]?)(\d*)(\.?)(.*)$/)
    cmd, opt, num, dot, txt = r[0]
    #print cmd, opt, num
    case cmd
    when 'o'
      if not num.empty? then
        octave = num.to_i
      end
    when 'l'
      if not num.empty? then
        length = num.to_i
      end
    when 't'
      if not num.empty? then
        use_bpm num.to_i
      end
    when 'v'
      if not num.empty? then
        set_volume! num.to_f / vol_scale
      end
    when '>'
      octave += 1
    when '<'
      octave -= 1
    when 'a'..'g', 'r'
      a = if opt == '+' then 's' elsif opt == '-' then 'b' else '' end
      n = cmd
      if n != 'r' then
        n += a + octave.to_s
      end
      t = (if dot.empty? then 4.0 else 6.0 end) / (if num.empty? then length else num.to_i end)
      loop do
        r = txt.scan(/^(\^|&[a-gr][+-]?)(\d*)(\.?)(.*)$/)
        if r.empty? then break end
        cmd, num, dot, txt = r[0]
        t += (if dot.empty? then 4.0 else 6.0 end) / (if num.empty? then length else num.to_i end)
      end
      play_pattern_timed [n.to_sym], [t], release: t
    when 'n'
      n = num.to_i + 12
      t = (if dot.empty? then 4.0 else 6.0 end) / length
      play_pattern_timed [n], [t], release: t
    else
      print "Unrecognised:", cmd + opt + num + dot
    end
  end
end
