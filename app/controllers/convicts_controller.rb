class ConvictsController < ApplicationController

  def index
    @convicts = Convict.order('name')
    unless params[:q].blank?
      @convicts = @convicts.where('name like ?', "%#{params[:q]}%") 
    end

    unless params[:boat].blank?
      @convicts = @convicts.where(:boat => params[:boat]) 
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
  end

  def show
    @convict = Convict.find(params[:id])
  end

end
