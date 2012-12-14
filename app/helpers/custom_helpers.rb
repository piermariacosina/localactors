Localactors.helpers do
	include Padrino::Helpers
	
	
		
	def validate_email(email)
		valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		return (valid_email_regex.match(email))? true : false
	end
	
	def check_member_subscription(email)
		gb = Gibbon.new
		gb.listMemberInfo({:id => 'e01ee24d90', :email_address => email})
	end
	
	def subscribe_to_list(email)
		gb = Gibbon.new
		gb.list_subscribe({:id => 'e01ee24d90', :email_address => email, :email_type => 'html', :double_optin => 'false', :update_existing => 'false', :replace_interests => 'true', :send_welcome => 'true'})
	end
	
	def mail_submit(email)
		unless email.nil? || email.strip.empty?
			if validate_email(email)
						memberInfo = check_member_subscription(email)
						if memberInfo.fetch('success') == 0
							if subscribe_to_list(email)
								flash[:success] = "success"
							else
								flash[:errors] = "fail"
							end
						else
							flash[:notice] = "You are already subscribed"
						end
			else
				flash[:notice] = "Email address is not valid"
			end
		else
			flash[:notice] = "Please fill the email field"
		end
		redirect '/#mailing-list'
	end
	
	def mail_submitjson(email)
		response = Hash.new
		unless email.nil? || email.strip.empty?
			if validate_email(email)
						memberInfo = check_member_subscription(email)
						if memberInfo.fetch('success') == 0
							if subscribe_to_list(email)
								response[:success] = "success"
							else
								response[:errors] = "fail"
							end
						else
							response[:notice] = "You are already subscribed"
						end
			else
				response[:notice] = "Email address is not valid"
			end
		else
			response[:notice] = "Please fill the email field"
		end
		
		return response.to_json
	end
end

