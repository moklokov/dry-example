# frozen_string_literal: true

require_relative 'config/application'

DryExample::Application.finalize!

run DryExample::Web.app
