class ItemController < ApplicationController
  before_action :authenticate_user!

  private

  def items_params
    params.require(:item).permit(:name, :amount, selected_ids: [])
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to home_path
    end
  end
end
