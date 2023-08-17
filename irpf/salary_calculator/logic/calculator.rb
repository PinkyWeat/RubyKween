module Calculator
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
  }

  # For BPS we're only taking into account those who have no children or spouse + salary's above 2.5 BPC
  BPS = 0.06
  FRL = 0.00125
  AP = 0.15

  def self.calculate_salary(net_salary)
    net_salary = net_salary.to_f
    bps_tax = net_salary * BPS
    frl_tax = net_salary * FRL
    ap_tax = net_salary * AP

    last_rate = range_in_irpf(net_salary)
    after_irpf = salary_after_irpf(net_salary.to_f, last_rate)
    
    after_all_discounts = after_irpf - bps_tax - frl_tax - ap_tax
    return after_all_discounts
  end

  def self.range_in_irpf(net_salary)
    last_rate = nil
    net_salary = net_salary.to_f
    IRPF_RANGES.each do |range, rate|
      last_rate = rate if net_salary >= range.begin
    end
    last_rate      
  end

  def self.salary_after_irpf(net_salary, last_rate)
    total_discounts = 0.0
    net_salary = net_salary.to_f
    FIXED_IRPF.each do |rate, amount|
      if last_rate > rate
        total_discounts += amount
      end
      if last_rate == rate
        corresponding_range = IRPF_RANGES.key(last_rate)
        total_discounts += (net_salary - corresponding_range.begin) * rate
      end
    end
    net_salary -= total_discounts
    return net_salary
  end

end
