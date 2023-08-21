class User
  include ActiveModel::Model

  attr_accessor :name, :net_salary, :family_status

  validates :name, presence: true, length: { minimum: 2 }
  validates :net_salary, presence: true, numericality: { greater_than: 0 }
  validates :family_status, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }

  def initialize(attributes = {})
    @name = attributes[:name]
    @net_salary = attributes[:net_salary].to_f
    @family_status = attributes[:family_status].to_i
  end
end

