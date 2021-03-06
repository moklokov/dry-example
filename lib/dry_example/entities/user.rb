# frozen_string_literal: true

module DryExample
  class User < ROM::Struct
    def full_name
      "#{first_name} #{last_name}"
    end
  end
end
