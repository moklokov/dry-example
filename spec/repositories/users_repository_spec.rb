# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DryExample::Repositories::UsersRepository do
  let(:repo) { described_class.new }

  describe '#create' do
    subject { repo.create(attributes) }

    let(:attributes) do
      { first_name: 'first name', last_name: 'last name', age: 18 }
    end

    it { expect(subject).to be_a(DryExample::User) }
    it { expect(subject.id).not_to be_nil }
    it { expect(subject.created_at).not_to be_nil }
    it { expect(subject.updated_at).not_to be_nil }
    it { expect(subject.first_name).to eql('first name') }
    it { expect(subject.last_name).to eql('last name') }
    it { expect(subject.age).to eql(18) }
  end

  describe '#all' do
    subject { repo.all }

    let!(:user) { repo.create(first_name: 'Test', last_name: 'Testov', age: 32) }

    it { expect(subject).to match_array([user]) }
  end
end
