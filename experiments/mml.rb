# Before running this file, first run helpers/mml.rb to load the mml function

use_debug false
use_synth :pulse
use_synth_defaults release: 0.3, mod_rate: 5, amp: 0.6

define :tetris do
  in_thread do
    use_synth :chiplead
    mml('t150>e4<b8>c8d8e16d16c8<b8a4a8>c8e4d8c8<b4.>c8d4e4c4<a4a2r8>d4f8a4g8f8e4.c8e4d8c8<b4b8>c8d4e4c4<a4a4r4.')
  end
  with_fx :level, amp: 0.5 do
    use_synth :chipbass
    mml('t150o2e8>e8<e8>e8<e8>e8<e8>e8<a8>a8<a8>a8<a8>a8<a8>a8<g+8>g+8<g+8>g+8<e8>e8<e8>e8<a8>a8<a8'+
        '>a8<a8>a8<b8>c8d8<d8r8d8r8d8a8f8c8>c8r8c8<c8g8g8r8b8>b8r8b8r8e8r8g+8<a8>e8<a8>e8<a4r4')
  end
end

define :tetris2 do
  in_thread do
    use_synth :chiplead
    mml('V127t150>e4<b8>c8d8e16d16c8<b8a4a8>c8e4d8c8<b4.>c8d4e4c4<a4a2&a8>d4f8a4g8f8e4.c8e4d8c8<b4'+
        'b8>c8d4e4c4<a4a2>e4<b8>c8d8e16d16c8<b8a4a8>c8e4d8c8<b4.>c8d4e4c4<a4a2&a8>d4f8a4g8f8e4.c8e4'+
        'd8c8<b4b8>c8d4e4c4<a4a2e2c2d2<b2>c2<a2g+2b2>e2c2d2<b2>c4e4a2g+1>e4<b8>c8d8e16d16c8<b8a4a8>'+
        'c8e4d8c8<b4.>c8d4e4c4<a4a2&a8>d4f8a4g8f8e4.c8e4d8c8<b4b8>c8d4e4c4<a4a2>e4<b8>c8d8e16d16c8<'+
        'b8a4a8>c8e4d8c8<b4.>c8d4e4c4<a4a2&a8>d4f8a4g8f8e4.c8e4d8c8<b4b8>c8d4e4c4<a4a4')
  end
  use_synth :chipbass
  with_fx :level, amp: 0.5 do
    with_octave 0 do
      mml('V127t150o3e8>e8<e8>e8<e8>e8<e8>e8<a8>a8<a8>a8<a8>a8<a8>a8<g+8>g+8<g+8>g+8<e8>e8<e8>e8<a8'+
          '>a8<a8>a8<a8>a8<b8>c8d8<d4d4d8a8f8c8>c4c8<c8g8g4b8>b4b4e4g+8<a8>e8<a8>e8<a2e8>e8<e8>e8<e8'+
          '>e8<e8>e8<a8>a8<a8>a8<a8>a8<a8>a8<g+8>g+8<g+8>g+8<e8>e8<e8>e8<a8>a8<a8>a8<a8>a8<b8>c8d8<'+
          'd4d4d8a8f8c8>c4c8<c8g8g4b8>b4b4e4g+8<a8>e8<a8>e8<a2>a8>e8<a8>e8<a8>e8<a8>e8<g+8>e8<g+8>e8'+
          '<g+8>e8<g+8>e8<a8>e8<a8>e8<a8>e8<a8>e8<g+8>e8<g+8>e2&e8<a8>e8<a8>e8<a8>e8<a8>e8<g+8>e8<g+'+
          '8>e8<g+8>e8<g+8>e8<a8>e8<a8>e8<a8>e8<a8>e8<g+8>e8<g+8>e2&e8<<e8>e8<e8>e8<e8>e8<e8>e8<a8>'+
          'a8<a8>a8<a8>a8<a8>a8<g+8>g+8<g+8>g+8<e8>e8<e8>e8<a8>a8<a8>a8<a8>a8<b8>c8d8<d4d4d8a8f8c8>'+
          'c4c8<c8g8g4b8>b4b4e4g+8<a8>e8<a8>e8<a2e8>e8<e8>e8<e8>e8<e8>e8<a8>a8<a8>a8<a8>a8<a8>a8<g+8'+
          '>g+8<g+8>g+8<e8>e8<e8>e8<a8>a8<a8>a8<a8>a8<b8>c8d8<d4d4d8a8f8c8>c4c8<c8g8g4b8>b4b4e4g+8<'+
          'a8>e8<a8>e8<a4')
    end
  end
end

define :mario do
  mml('t105>e16e8e8c16e8g2c8.<g8.e8.a8b8a+16a8g16.>e16g16.a8f16g8e8c16d16<b8.>c8.<g8.e8.a8b8a+16a8g16.'+
      '>e16g16.a8f16g8e8c16d16<b4&b16>g16f+16f16d+8e8<g+16a16>c8<a16>c16d8.g16f+16f16d+8e8>c8c16c4.<g16'+
      'f+16f16d+8e8<g+16a16>c8<a16>c16d8.d+8.d8.c2&c8g16f+16f16d+8e8<g+16a16>c8<a16>c16d8.g16f+16f16d+8'+
      'e8>c8c16c4.<g16f+16f16d+8e8<g+16a16>c8<a16>c16d8.d+8.d8.c2c16c8c8c16d8e16c8<a16g4>c16c8c8c16d16'+
      'e2&e16c16c8c8c16d8e16c8<a16g4>e16e8e8c16e8g2c8.<g8.e8.a8b8a+16a8g16.>e16g16.a8f16g8e8c16d16<b8.>'+
      'c8.<g8.e8.a8b8a+16a8g16.>e16g16.a8f16g8e8c16d16<b8.>e16c8<g8.g+8a16>f8f16<a4b16.>a16a16.a16.g16'+
      'f16.e16c8<a16g4>e16c8<g8.g+8a16>f8f16<a4b16>f8f16f16.e16d16.c2e16c8<g8.g+8a16>f8f16<a4b16.>a16a16.'+
      'a16.g16f16.e16c8<a16g4>e16c8<g8.g+8a16>f8f16<a4b16>f8f16f16.e16d16.c2c16c8c8c16d8e16c8<a16g4>c16'+
      'c8c8c16d16e2&e16c16c8c8c16d8e16c8<a16g4>e16e8e8c16e8g2e16c8<g8.g+8a16>f8f16<a4b16.>a16a16.a16.g16'+
      'f16.e16c8<a16g4>e16c8<g8.g+8a16>f8f16<a4b16>f8f16f16.e16d16.c3')
end

define :cantina do
  in_thread do
    mml('v120t250a4>d4<a4>d4<a8>d4<a4g+8a4a8g+8a8g4f+8g8f+8f2d2a4>d4<a4>d4<a8>d4<a4g+8a4g4g4.f+8g4>'+
        'c8<a+4a4g4.a4>d4<a4>d4<a8>d4<a4g+8a4>c4c4.<a8g4f4.d2&d8d2f2a2>c2d+4d4<g+8a4f1&f4a4f8a2&a8a4'+
        'f8a2&a8a4f8g+8a4.f2d2&d8a4f8a2&a8a4f8a2&a8a4f8g+8a4.g2c2&c8a4f8a2&a8a4f8a2&a8a4f8g+8a4.f2d2'+
        '<a+8>d8f4<b8>d8f4g+8a4d2&d8d8f8a+8>d8<g+8a4f1&f8f4.g+4f8g4.f8g+8f8g8f8g+4f4.g+4f8g4.f8g+8f8'+
        'g8f8g+4f4.g+4f8g4.f8g+8f8g8f8g+4f8f8g+8f8g8f8g+8f8g8f8g+8f8g8f8g+8f8f2g+8f8g4.f8g+8f8g8f8g+4'+
        'f4.g+4f8g4.f8g+8f8g8f8g+4f4.g+4f8g4.f8g+8f8g8f8g+4f8f8g+8f8g8g+4f1&f8t250a4>d4<a4>d4<a8>d4<'+
        'a4g+8a4a8g+8a8g4f+8g8f+8f2d2a4>d4<a4>d4<a8>d4<a4g+8a4g4g4.f+8g4>c8<a+4a4g4.a4>d4<a4>d4<a8>d4'+
        '<a4g+8a4>c4c4.<a8g4f4.d2&d8<a+8>d8f4<b8>d8f4g+8a4d2&d8d8f8a+8>d8<g+8a4f2&f8>f2')
  end
  in_thread do
    mml('v120t250<<a4>d4<a4>d4<a8>d4<a4g+8a4a8g+8a8g4f+8g8f+8f2d2a4>d4<a4>d4<a8>d4<a4g+8a4>d4d4.c+8'+
        'd4d8<a+4a4g4.a4>d4<a4>d4<a8>d4<a4g+8a4g4g4.e8e4f4.d2&d8d2d2f2a2a+4a4e8e4f1&f4>f4d8f2&f8f4d8'+
        'f2&f8f4d8e8f4.d2<a2&a8>f4d8f2&f8f4d8f2&f8f4d8e8f4.d2<g2&g8>f4d8f2&f8f4d8f2&f8f4d8e8f4.d2<a2'+
        'a+8>d8d4<b8>d8d4e8f4<a2&a8d8f8a+8>d8<g+8a4f1&f8>d4.f4d8e4.d8f8d8e8d8f4d4.f4d8e4.d8f8d8e8d8'+
        'f4d4.f4d8e4.d8f8d8e8d8f4d8d8f8d8e8d8f8d8e8d8f8d8e8d8f8d8d4.f4d8e4.d8f8d8e8d8f4d4.f4d8e4.d8'+
        'f8d8e8d8f4d4.f4d8e4.d8f8d8e8d8f4d8d8f8d8e8f4d1&d8<a4>d4<a4>d4<a8>d4<a4g+8a4a8g+8a8g4f+8g8'+
        'f+8f2d2a4>d4<a4>d4<a8>d4<a4g+8a4>d4d4.c+8d4d8<a+4a4g4.a4>d4<a4>d4<a8>d4<a4g+8a4g4g4.e8e4f4.'+
        'd2&d8a+8>d8d4<b8>d8d4e8f4<a2&a8d8f8a+8>d8<g+8a4f2&f8>f2')
  end
  mml('v120t250<d2<a2>d2<a2>d2c2f2<d2>d2<a2>d2<a2g2g2>c8<a+4a4g4.>d2<a2>d2<a2>e4e4.c8c4<f4.d2&d8a+2'+
      'a+2>c2f+2d+4d4<g+8a4f4.>e4d4c4d2a2d2a2d2a2d2<a2>d2a2d2a2d2a2g2c2d2a2d2a2d2a2d2<a2a+2b2>c2c+2d2'+
      'e2f4e4d4c4d4c4<a+4a4g4f4e4d4>d4c4<a+4a4g4f4e4d4>d4c4<a+4a4g4f4e4d4>d1&d1d4c4<a+4a4g4f4e4d4>d4'+
      'c4<a+4a4g4f4e4d4>d4c4<a+4a4g4f4e4d4f8f8g+8f8g8g+4f1&f8>d2<a2>d2<a2>d2c2f2<d2>d2<a2>d2<a2g2g2>'+
      'c8<a+4a4g4.>d2<a2>d2<a2>e4e4.c8c4<f4.d2&d8a+2b2>c2c+2d2e2f2<f2')
end

define :surprise do
  mml('MML@l16<f+g+bg+>d+8.d+8.c+4.<f+g+bg+l8.>c+c+<bl16a+g+8f+g+bg+b4>c+8<a+8.g+f+4f+8>c+8<b8b2f+g+'+
      'bg+>d+4d+8c+4.<f+g+bg+>f+4<b8b8.a+g+8f+g+bg+b4>c+8<a+8.g+l4f+f+8>c+4<b1;')
end

# Uncomment one of the following lines and run:
#tetris
#tetris2
mario
#cantina
#surprise
