Localactors.helpers do
	include Padrino::Helpers
	

	def self.component_include_tag(*sources)
		options = sources.extract_options!.symbolize_keys
		options.reverse_merge!(:type => 'text/javascript')
		sources.flatten.map { |source|
			content_tag(:script, nil, options.reverse_merge(:src => component_path(:js, source)))
		}.join("\n")
	end
	
	def self.component_path(kind, source)
		return source if source =~ /^http/
		is_absolute  = source =~ %r{^/}
		component_folder = component_folder_name(kind)
		source = source.to_s.gsub(/\s/, '%20')
		ignore_extension = (component_folder.to_s == kind.to_s) # don't append an extension
		source << ".#{kind}" unless ignore_extension or source =~ /\.#{kind}/
		result_path = is_absolute ? source : uri_root_path(component_folder, source)
		timestamp = component_timestamp(result_path, is_absolute)
		"#{result_path}#{timestamp}"
	end
	
	def self.component_folder_name(kind)
		case kind
		when :css then 'stylesheets'
		when :js  then 'javascripts'
		else kind.to_s
		end
	end
	
	
	
end

