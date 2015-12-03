module CuriositiesHelper
  def curiosity_params
    params.require(:curiosity).permit(:title, :description, :tag_list, :image)
  end
end
