class ExpendituresController < ApplicationController
  def index
    @expenditures = Expenditure.fetch_expenditures(params[:user_id])

    render json: @expenditures, status: :ok
	end
	
	private

  def expenditure_params
    params.require(:expenditure).permit(:category, :value, :date, :description, :user_id)
  end
end
