# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DryExample::Services::Users::CreateUser do
  let(:users_repository) { double('UserRepository') }
  let(:user) { DryExample::User.new(id: 1, first_name: 'Test', last_name: 'Testov', age: 13) }

  subject { described_class.new(users_repository: users_repository).call(params) }

  context 'when valid contract' do
    before { allow(users_repository).to receive(:create).and_return(user) }

    let(:params) { { first_name: 'Test', last_name: 'Testov', age: 13 } }

    it { expect(subject).to be_success }
    it { expect(subject.success).to eql(user) }
  end

  context 'when invalid contract' do
    let(:params) { { last_name: 'Testov', age: 13 } }

    it { expect(subject).to be_failure }
    it { expect(subject.failure.errors.to_h).to eql(first_name: ['is missing']) }
  end
end
