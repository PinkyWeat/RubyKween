module Calculator
  include TaxConstants

  def self.calculate_salary(net_salary, family_status)
    net_salary = net_salary.to_f
    # bps_tax = net_salary * BPS
    frl_tax = net_salary * FRL
    ap_tax = net_salary * AP

    last_rate = range_in_irpf(net_salary)
    after_irpf = salary_after_irpf(net_salary.to_f, last_rate)
    after_fonasa = salary_after_fonasa(net_salary, family_status)
   #  after_all_discounts = after_irpf - bps_tax - frl_tax - ap_tax
    puts "\nHere's the data we have. after_irpf: #{after_irpf}, after_fonasa: #{after_fonasa}, frl_tax: #{frl_tax}, ap_tax = #{ap_tax}"
    after_all_discounts = after_irpf - after_fonasa - frl_tax - ap_tax
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

  def self.salary_after_fonasa(net_salary, family_status)
    fonasa_rate = 0
    FONASA.each do |option, rate|
      if family_status.to_i == option
        puts "entre?"
        fonasa_rate = net_salary * rate
      end
    end
    return fonasa_rate
  end

end
