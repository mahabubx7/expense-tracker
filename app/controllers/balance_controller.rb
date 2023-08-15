class BalanceController < ApplicationController
  before_action :authenticate_user!

  private

  def balance_params
    params.require(:balance).permit(:name, :icon)
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to home_path
    end
  end
end
