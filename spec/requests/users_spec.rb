# frozen_string_literal: true

require 'web_helper'

RSpec.describe '/users' do # rubocop: disable Metrics/BlockLength
  describe 'POST /' do # rubocop: disable Metrics/BlockLength
    subject { post_json '/users', params }

    context 'when valid params' do
      let(:params) { { first_name: 'Test', last_name: 'Testov', age: 30 } }

      it 'success response' do
        subject
        expect(last_response.status).to eql(200)
      end

      it 'valid body' do
        subject
        user = parsed_body
        expect(user['id']).not_to be_nil
        expect(user['first_name']).to eql('Test')
        expect(user['last_name']).to eql('Testov')
        expect(user['age']).to eql(30)
      end
    end

    context 'when invalid params' do
      let(:params) { { last_name: 'Testov', age: 30 } }

      it 'unprocessible response' do
        subject
        expect(last_response.status).to eql(422)
      end

      it 'returns an error' do
        subject
        expect(parsed_body['errors']['first_name']).to include('is missing')
      end
    end
  end
end
