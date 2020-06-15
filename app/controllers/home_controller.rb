class HomeController < ApplicationController
  def index
    @cases = Case.verified.left_outer_joins(:donors_cases).joins(:donors).where("donors_cases.state != 'protected'")
  end
end
