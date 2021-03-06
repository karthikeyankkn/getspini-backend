class LeadsController <  ApplicationController
	include HTTParty
	debug_output $stdout
	skip_before_action :verify_authenticity_token
	def create
		@lead = Lead.new(lead_prams)
	      if @lead.save
	      	# binding.pry
	      	if @lead[:source] == "direct"
	      		data = {
	      			cityName: @lead[:city],
	      			categoryName: @lead[:category],
	      			prospectiveBuyersName: @lead[:direct_lead_name],
	      			emailOfProspectiveBuyer: @lead[:direct_lead_email],
	      			phoneNumOfProspectiveBuyer: @lead[:direct_lead_number],
	      			# categoryName:@lead[:category],
	      			budgetAmount: @lead[:budget_amount]
	      		}
	      		 # Sms.new(data).send
	      		 # puts response
	      		@response = HTTParty.post('https://api.getspini.com:8443/SpinGrailsApp/web/site/leads/website/create/for/self/requirement',
				{ 
				:headers => { 
					'Content-Type' => 'application/json', 
					'X-SPIN-API-ACCESS-TOKEN' => 'HJKhlkasehl%jakbdajd81836sagsagHGSC*&t3@!UI',
					'ORIGIN' => 'https://wapi.getspini.com'
				},	
    			:body => data.to_json
  				});
  				# binding.pry
	      	else
	      		# binding.pry
	      		data = {
	      			referrersName:@lead[:direct_lead_name],
	      			phoneNumOfReferrer:@lead[:direct_lead_number],
	      			prospectiveBuyersName:@lead[:referal_lead_name],
	      			phoneNumOfProspectiveBuyer:@lead[:referal_lead_number],
	      			cityName: @lead[:city],
	      			categoryName: @lead[:category]
	      		}
	      		@response = HTTParty.post('https://api.getspini.com:8443/SpinGrailsApp/web/site/leads/website/create/for/self/requirement',
				{ 
    			:body => data.to_json,
    			:headers => { 'Content-Type' => 'application/json', 'X-SPIN-API-ACCESS-TOKEN' => 'HJKhlkasehl%jakbdajd81836sagsagHGSC*&t3@!UI',
    			'ORIGIN' => 'https://wapi.getspini.com' }
  				});
  				# binding.pry
  				# puts @response.code
  				# render json: @lead, status: :created
	      	end
	      else
	      	render json: @lead.errors, status: :unprocessable_entity
	      end
	end
	private
	def lead_prams
		params.require(:lead).permit(:city,:category,:direct_lead_name,:direct_lead_number,:referal_lead_name,:referal_lead_number,:source,:budget_amount,:direct_lead_email)
	end

end