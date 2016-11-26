# Drum sequencer
# Pass it pairs of samples and patterns (string) and a tick duration.
# A space or dot in the pattern represents a rest, and a star plays
# the sample. Other characters will modify the sample by appending
# e.g. '_soft' or '_hard' to the sample name - meant to be used with
# the builtin samples that have variants with different endings (see
# example in experiments subdirectory).

define :seq_expand do |sample, pat|
  # Expand sample base and pattern to array of samples
  pat.split('').map do |c|
    case c
    when '*'
      sample
    when 'x', 's', 'S'
      (sample.to_s + '_soft').to_sym
    when 'X', 'h', 'H'
      (sample.to_s + '_hard').to_sym
    when 'o', 'O'
      (sample.to_s + '_open').to_sym
    when 'c', 'C'
      (sample.to_s + '_closed').to_sym
    when 'p', 'P'
      (sample.to_s + '_pedal').to_sym
    when '.', ' '
      nil
    else
      puts 'Unknown character in sequence:', c
      nil
    end
  end
end

define :seq do |parts, t=1|
  # Drum sequencer
  parts.each_slice(2).map{|s,p| seq_expand s,p}.transpose.each do |ss|
    ss.each do |s|
      sample s if s
    end
    sleep t
  end
end
