# frozen_string_literal: true

module DryExample
  module Web
    Router = Hanami::Router.new do
      post '/users', to: Controllers::Users::Create
    end
  end
end
