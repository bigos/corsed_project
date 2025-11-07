class Api::V1::HellosController < ApplicationController
  def show
    render json: { hello: "hello - it's #{Time.now}" }
  end
end
