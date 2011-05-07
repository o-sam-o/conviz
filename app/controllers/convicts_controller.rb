class ConvictsController < ApplicationController

  def index
    @convicts = Convict.order('name')
    unless params[:q].blank?
      @convicts = @convicts.where('name like ?', "%#{params[:q]}%") 
    end
    
    @convicts = @convicts.paginate :page => params[:page]
  end

  def show
    @convict = Convict.find(params[:id])
  end

end
