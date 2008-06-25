class WidgetController < HandController
  def full
    hit
    @css = params[:css]
    calculate(:new=>true)
    @widget = true
    render :actiuon=>"full",:widget=>true, :layout=>false
  end
  def list
  end
end