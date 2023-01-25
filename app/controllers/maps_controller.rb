class MapsController < ApplicationController
  before_action :authenticate_customer!
  before_action :authenticate_doctor!
  before_action :authenticate_admin!
  def index
  end

end
