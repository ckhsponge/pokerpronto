class WidgetController < HandController
  def full
    hit
    @css = params[:css]
    calculate(:new=>true)
  end
  def list
  end
end