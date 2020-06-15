class HomeController < ApplicationController
  def index
    @cases = Case.verified.joins(:donors_cases).joins(:donors)
                 .where("donors_cases.state = 'pending' or donors_cases.state = 'cancelled'")
  end
end
