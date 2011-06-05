class ConvictsController < ApplicationController

  def index
    @convicts = Convict.order("#{params[:sort].present? ? params[:sort] : 'name'} #{params[:direction].present? ? params[:direction] : 'ASC'}")
    unless params[:q].blank?
      @convicts = @convicts.where('lower(name) like ?', "%#{params[:q].downcase.strip}%") 
    end

    unless params[:boat].blank?
      @convicts = @convicts.where(:boat => params[:boat]) 
    end

    unless params[:term].blank?
      @convicts = @convicts.where(:term => params[:term]) 
    end

    unless params[:last_name].blank?
      @convicts = @convicts.where('lower(last_name) = ?', params[:last_name].downcase.strip) 
    end

    unless params[:first_name].blank?
      @convicts = @convicts.where('lower(first_name) = ?', params[:first_name].downcase.strip) 
    end    

    unless params[:departure_year].blank?
      @convicts = @convicts.where(:departure_year => params[:departure_year]) 
    end
    
    unless params[:destination].blank?
      @convicts = @convicts.where(:destination => params[:destination]) 
    end
    
    unless params[:court_county].blank?
      @convicts = @convicts.where(:court_county => params[:court_county])
    end

    @convicts = @convicts.paginate :page => params[:page]

    respond_to do |format|
      format.html
      format.json { render :json => {:records => @convicts} }
    end
  end

  def show
    @convict = Convict.find(params[:id])
  end

end
