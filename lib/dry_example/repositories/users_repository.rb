# frozen_string_literal: true

module DryExample
  module Repositories
    class UsersRepository < ROM::Repository[:users]
      include Import['container']

      struct_namespace DryExample

      commands :create, use: :timestamps, plugins_options: { timestamps: { timestamps: %i[created_at updated_at] } }

      def all
        users.to_a
      end
    end
  end
end
