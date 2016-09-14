class ElementsController < ApplicationController

  def update
    el = Element.find(params[:id])
    if el.update(el_params)
      render plain: 'Changes saved'
    else
      render plain: 'There was an error'
    end 
  end


private

  def el_params
    params.require(:element).permit(:color, :size)
  end

end
