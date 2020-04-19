# frozen_string_literal: true

module DryExample
  module Services
    module Users
      class CreateUser
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import['contracts.users.create_user']
        include Import['repositories.users_repository']

        def call(params)
          values = yield validate(params)
          user = yield persist(values)

          Success(user)
        end

        private

        def validate(params)
          create_user.call(params).to_monad
        end

        def persist(result)
          Success(users_repository.create(result.values))
        end
      end
    end
  end
end
