class CalculationsController < ApplicationController
  def calculator
    # This method just renders the form.
  end

  def calculate_salary
    user = User.new(user_params)

    if user.valid?
      @result_name = user.name
      @result_net_salary = user.net_salary
      @result_family_status = user.family_status
      @sad_salary = Calculator.calculate_salary(user.net_salary, user.family_status)
    else
      # Handle validation errors (e.g., render the form with error messages)
      render :calculator
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :net_salary, :family_status)
  end
end

