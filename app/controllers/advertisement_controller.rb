class AdvertisementController < ApplicationController
  def random
    render_text Advertisement.random
  end
end