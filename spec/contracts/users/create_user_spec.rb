# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DryExample::Contracts::Users::CreateUser do
  subject { described_class.new.call(params) }

  context 'when valid' do
    let(:params) { { first_name: 'Test', last_name: 'Testov', age: 18 } }

    it { expect(subject).to be_success }
  end

  context 'when invalid' do
    context 'requires first name' do
      let(:params) { { last_name: 'Testov', age: 18 } }

      it { expect(subject).to be_failure }
      it { expect(subject.errors[:first_name]).to include('is missing') }
    end

    context 'requires last name' do
      let(:params) { { first_name: 'Test', age: 18 } }

      it { expect(subject).to be_failure }
      it { expect(subject.errors[:last_name]).to include('is missing') }
    end
  end
end
