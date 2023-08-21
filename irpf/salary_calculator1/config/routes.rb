Rails.application.routes.draw do
  get 'calculations/calculator'
  
  #post 'calculate_salary', to: 'calculations#calculate_salary'
  post 'calculations/calculate_salary'
  root 'calculations#calculator'
end

