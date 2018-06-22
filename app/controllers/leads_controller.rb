class LeadsController <  ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		@lead = Lead.new(lead_prams)
	      if @lead.save
	        render json: @lead, status: :created
	      else
	      	render json: @lead.errors, status: :unprocessable_entity
	      end
	end
	private
	def lead_prams
		params.require(:lead).permit(:city,:category,:direct_lead_name,:direct_lead_number,:referal_lead_name,:referal_lead_number)
	end

end