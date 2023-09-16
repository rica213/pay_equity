class SalariesController < ApplicationController
  before_action :authenticate_user!

  # Allow a user to retrieve their own salary data
  # GET /salaries
  def index
    @salaries = current_user.salaries
    render json: @salaries
  end

  # Create a new salary record associated with the current user
  # POST   /salaries
  def create
    @salary = current_user.salaries.build(salary_params)

    if @salary.save
      render json: @salary, status: :created
    else
      render json: { errors: @salary.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Allow a user to update their salary and benefits data for a specific
  # PATCH/PUT /salaries/:id
  def update
    @salary = current_user.salaries.find(params[:id])

    if @salary.update(salary_params)
      render json: @salary, status: :ok
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  # Allow a user to delete a specific salary entry
  # DELETE /salaries/:id
  def destroy
    @salary = current_user.salaries.find(params[:id])
    if @salary.destroy
      head :no_content
    else
      render json: { errors: ["Failed to delete salary entry"] }, status: :unprocessable_entity
    end
  end

  # Allow users to search for salary data based on different criteria
  # GET /salaries/search
  def search
    filters = params.permit(:industry, :location, :job_title)

    query = Salary.all

    filters.each do |filter, value|
      query = query.where(filter => value) if value.present?
    end

    results = query.all

    if results.any?
      render json: results
    else
      render json: { errors: ["No matching salary data found"] }, status: :not_found
    end
  end

  # Allow users to compare their salary data with aggregated data for specific criteria
  # GET /salaries/compare
  def compare
    criteria = params[:criteria]

    query = Salary.none

    criteria.each do |criterion|
      if params[criterion].present?
        query = query.or(Salary.where(criterion => params[criterion]))
      end
    end

    results = query.all

    if results.any?
      render json: results
    else
      render json: { errors: ["No matching salary data found"] }, status: :not_found
    end
  end

  private

  def salary_params
    params.require(:salary).permit(:salary, :benefits)
  end
end
