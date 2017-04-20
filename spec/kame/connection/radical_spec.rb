require 'spec_helper'
require 'json'

describe Kame::Connection::Radical do

  let(:level) { 7 }

  subject { described_class.new level }

  let(:api_key) { 'random_api_key' }
  let(:connector) { double 'connector' }

  before do
    allow(Kame::Setup).to receive(:api_key).
      and_return api_key

    allow(Kame::Setup).to receive(:valid?).
      and_return !api_key.nil?

    allow(subject).to receive(:connection).
      and_return connector
  end

  describe '#call' do
    let(:status)   { 200 }
    let(:body)     { {"json" => "body"}.to_json }
    let(:response) { double 'response', :status => status, :body => body }

    let(:endpoint_base) { Kame::Connection::Base::ENDPOINT_BASE }

    context 'level provided' do
      let(:expected_path) { "#{endpoint_base}/#{api_key}/radicals/#{level}" }

      it 'makes que right request' do
        expect(connector).to receive(:get).
          with(expected_path).and_return response

        expect(subject.call).to eq "json" => "body"
      end
    end

    context 'no level provided' do
      let(:level) { nil }
      let(:expected_path) { "#{endpoint_base}/#{api_key}/radicals/" }

      it 'makes que right request' do
        expect(connector).to receive(:get).
          with(expected_path).and_return response

        expect(subject.call).to eq "json" => "body"
      end
    end

    context 'no api key' do
      let(:api_key) { nil }

      it 'raises an error' do
        expect{subject.call}.to raise_error(ArgumentError, 'Missing API key')
      end
    end

    context 'status different to 200' do
      let(:expected_path) { "#{endpoint_base}/#{api_key}/radicals/#{level}" }

      let(:status) { 500 }
      let(:connection_error) { described_class::WanikaniConnectionError }

      it 'raises an error' do
        expect(connector).to receive(:get).
          with(expected_path).and_return response

        expect{subject.call}.to raise_error connection_error
      end
    end
  end
end