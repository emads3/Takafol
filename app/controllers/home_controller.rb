class HomeController < ApplicationController
  def index
    @cases = Case.joins(:charities_cases).joins(:charities).where("charities_cases.state = 'protected'")
    # @cases = @verified.left_outer_joins(:donors_cases).where("donors_cases.state != 'approved'")
    # @cases = Case.verified.left_outer_joins(:donors_cases).joins(:donors).where("donors_cases.state != 'approved'")
  end
end
