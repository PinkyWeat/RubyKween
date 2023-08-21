require "test_helper"

class SalaryControllerTest < ActionDispatch::IntegrationTest
  test "should get calculator" do
    get salary_calculator_url
    assert_response :success
  end
end
