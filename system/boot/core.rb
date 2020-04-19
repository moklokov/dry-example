# frozen_string_literal: true

DryExample::Application.boot(:core) do
  init do
    require 'dry-validation'
  end
end
