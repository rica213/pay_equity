class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    user = current_user

    if user.update(user_params)
      render json: { message: "Profile updated successfully", user: user }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:gender, :pronoun, :job_title, :year_of_experience, :location, :industry)
  end
end
