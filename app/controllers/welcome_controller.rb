class WelcomeController < ApplicationController

  skip_before_action :before_require_login, only: [
    :index
  ]

  def index

  end
end
