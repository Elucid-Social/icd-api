# frozen_string_literal: true

require 'spec_helper'

module Icd
  module Api
    RSpec.describe AuthorizeToken do
      before :suite do
        described_class.configure do |conf|
          conf.client_id = 'client_id'
          conf.client_secret = 'client_secret'
        end
      end
      describe '#retrieve_access_token' do
        subject { described_class.call }

        it 'sends request to token endpoint' do
          VCR.use_cassette('icd/api/authorize_token') do
            expect(subject).to be_a(Icd::Api::AccessToken)
          end
        end

        it 'returns access token with expire in 3600' do
          VCR.use_cassette('icd/api/authorize_token') do
            expect(subject.expires_at.to_i).to be_within(5).of(Time.now.to_i + 3600)
          end
        end

        context 'when the token is expired' do
          let(:expired_token) { AccessToken.new({ 'expires_in' => 0, 'access_token' => 'expired_token' }) }
          before do
            described_class.instance_variable_set(:@access_token, expired_token)
          end

          it 'gets a new token' do
            VCR.use_cassette('icd/api/authorize_token') do
              expect { subject }.to change(described_class, :access_token)
              expect(subject.expires_at.to_i).to be_within(5).of(Time.now.to_i + 3600)
            end
          end
        end
      end
    end
  end
end
