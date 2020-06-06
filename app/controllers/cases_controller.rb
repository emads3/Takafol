class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy  ]
  skip_before_action :verify_authenticity_token


  # GET /cases
  # GET /cases.json
  def index
    @cases = Case.all.order(priority: :desc)
  end

  #Free Cases Index
  def freeindex
    @cases = Case.all.order(priority: :desc)
  end

  #Profile
  def profile
    @cases = Case.all
  end

  # GET /cases/1
  # GET /cases/1.json
  def show
    @case= Case.find(params["id"])
  end

  # Add Case to Donor
  def protect
    @case = Case.find(params["id"])

     if @case.donors_cases.where('state in (?)' , ["pending","cancelled","rejected"]).count < 1
      @case.donors << current_donor
    end
    @case.donors_cases.update(state: "pending" )

    redirect_to cases_path
  end

  def freeprotect
    @case = Case.find(params["id"])
    @case.charities << current_charity
    @case.charities_cases.update(state: "protected" )
    redirect_to cases_path
  end


  #Remove Donor's Protection
  def remove
    id = current_donor.id
    @case = Case.find(params["id"])
    @case = @case.donors_cases.where(donor_id = "#{id}").update(state: "cancelled")
    redirect_to cases_path

  end

  #Charity's Approval to Donor's Request
  def updatestate
    @id = params["id"].to_i
    @case =Case.find(@id)
    @case.donors_cases.last.update(state: params["case"]["donors_cases"]["state"])
    @case.charities_cases.last.update(state: "released")
    # redirect_to hi
    # render plain("hiiii")

  end

  # GET /cases/new
  def new
    @case = Case.new
  end

  # GET /cases/1/edit
  def edit
  end

  # POST /cases
  # POST /cases.json
  def create

    #If a Charity is signed in the case will be assigned to it automatically
    if current_charity 

        @case = @current_charity.cases.create(case_params_charity)
        @case.charities_cases.first.update(state: "protected")
        respond_to do |format|
          if @case.save
            format.html { redirect_to @case, notice: 'Case was successfully created.' }
            format.json { render :show, status: :created, location: @case }
          else
            format.html { render :new }
            format.json { render json: @case.errors, status: :unprocessable_entity }
          end
        end

      else 

        @case = Case.new(case_params)
        respond_to do |format|
          if @case.save
            format.html { redirect_to @case, notice: 'Case was successfully created.' }
            format.json { render :show, status: :created, location: @case }
          else
            format.html { render :new }
            format.json { render json: @case.errors, status: :unprocessable_entity }
          end
        end
   end

  end

  # PATCH/PUT /cases/1
  # PATCH/PUT /cases/1.json
  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to @case, notice: 'Case was successfully updated.' }
        format.json { render :show, status: :ok, location: @case }
      else
        format.html { render :edit }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    @case.destroy
    respond_to do |format|
      format.html { redirect_to cases_url, notice: 'Case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def case_params
      params.fetch(:case).permit(:name , :job , :national_id , :description)
    end

    #Charity's Special Params to add Case
    def case_params_charity
      params.fetch(:case).permit(:name , :job , :priority , :national_id , :amount_needed)
    end
end
