Localactors.helpers do
	include Padrino::Helpers
	
	
		
	def validate_email(email)
		valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		return (valid_email_regex.match(email))? true : false
	end
	
	def check_member_subscription(email)
		gb = Gibbon.new
		gb.listMemberInfo({:id => 'a060862fbc', :email_address => email})
	end
	
	def subscribe_to_list(email)
		gb = Gibbon.new
		gb.list_subscribe({:id => 'a060862fbc', :email_address => email, :email_type => 'html', :double_optin => 'false', :update_existing => 'false', :replace_interests => 'true', :send_welcome => 'true'})
	end
	
	def mail_submit(email,content_type)
		flash.discard
		unless email.nil? || email.strip.empty?
			if validate_email(email)
						memberInfo = check_member_subscription(email)
						if memberInfo.fetch('success') == 0
							if subscribe_to_list(email)
								if content_type == :json
									flash.now[:success] = "success"
								else
									flash[:success] = "success"
								end
							else
								if content_type == :json
									flash.now[:errors] = "fail"
								else
									flash[:errors] = "fail"
								end
							end
						else
							if content_type == :json
								flash.now[:notice] = "You are already subscribed"
							else
								flash[:notice] = "You are already subscribed"
							end
						end
			else
				if content_type == :json
					flash.now[:notice] = "Email address is not valid"
				else
					flash[:notice] = "Email address is not valid"
				end
				
			end
		else
			if content_type == :json
				flash.now[:notice] = "Please fill the email field"
			else
				flash[:notice] = "Please fill the email field"
			end
			
		end
		
		if content_type == :json
			return flash.to_json
		else
			redirect "/#mailing-list"
		end 
	end
end

