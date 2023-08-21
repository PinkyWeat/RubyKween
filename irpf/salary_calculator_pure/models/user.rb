class User
  attr_reader :name, :net_salary, :family_status

  def initialize(name, net_salary, family_status)
    self.name = name
    self.net_salary = net_salary
    self.family_status = family_status
  end

  def net_salary=(value)
    raise "Net salary cannot be negative" if value < 0
    @net_salary = value.to_f
  end

  def name=(value)
    raise "Name should have at least 2 characters" if value.strip.length < 2
    @name = value.strip
  end

  def family_status=(value)
    raise "Option isn't within the provided ones" unless (1..5).include?(value)
    @family_status = value
  end
end
