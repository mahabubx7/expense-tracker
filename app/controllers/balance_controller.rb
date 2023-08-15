class BalanceController < ApplicationController
  before_action :authenticate_user!

  def index
    @balances = Balance.where(author_id: current_user.id).includes([:items]).order('created_at DESC')
  end

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
