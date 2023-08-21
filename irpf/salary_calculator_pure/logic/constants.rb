module TaxConstants
  IRPF_RANGES = {
    (0..39620) => 0,
    (39621..56600) => 0.10,
    (56601..84900) => 0.15,
    (84901..169800) => 0.24,
    (169801..283000) => 0.25,
    (283001..424500) => 0.27,
    (424501..650900) => 0.31,
    (650901..Float::INFINITY) => 0.36
  }.freeze

  FIXED_IRPF = {
    0 => 0,
    0.10 => 1697.9,
    0.15 => 4244.85,
    0.24 => 20375.76,
    0.25 => 28299.75,
    0.27 => 38204.73,
    0.31 => 70183.69
   }.freeze

  FONASA = {
    1 => 0.03,
    2 => 0.045,
    3 => 0.06,
    4 => 0.065,
    5 => 0.08
  }.freeze

  FRL = 0.00125
  AP = 0.15
  
end