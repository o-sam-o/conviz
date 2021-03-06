module ConvictsHelper

  # TODO add support for multiple params
  def convicts_page_title(params)
     if params[:boat].present?
      "Convicts transported on the #{params[:boat]}"
     elsif params[:destination].present?
      "Convicts bound for #{params[:destination]}"
     elsif params[:departure_year].present?
      "Convicts departing in #{params[:departure_year]}"
     elsif params[:court_county].present?
      "Convicts convicted near #{params[:court_county]}"
     elsif params[:term].present?
      "Convicts sentences to #{humanize_term params[:term]}"
     elsif params[:first_name].present?
      "Convicts with first name #{humanize_term params[:first_name].titleize}"
     elsif params[:last_name].present?
      "Convicts with last name #{humanize_term params[:last_name].titleize}"
     elsif params[:q].present?
      "Searching Convicts for: #{params[:q].titleize}"
     else
      "Convict Lists"
     end
  end

  # Returns a url fragment containing the params used to filter the convict list
  def filtering_params(params)
    params.collect { |value| ['sort', 'direction'].include?(value[0]) ? '' : "&#{value[0]}=#{value[1]}" }.join
  end

end

