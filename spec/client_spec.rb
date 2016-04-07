require_relative './spec_helper'

RSpec.describe EStat::Client, :vcr do
  describe :stats_list do
    let(:params) { { openYears: '2016', statsCode: '00200502', searchKind: '3', statsNameList: 'Y' } }
    it 'with_valid_app_id' do
      expect(valid_client.stats_list(params)).to include('GET_STATS_LIST')
    end
  end

  describe :meta_info do
    let(:params) { { statsDataId: '0003014522' } }
    it 'with_valid_app_id' do
      expect(valid_client.meta_info(params)).to include('GET_META_INFO')
    end
  end

  describe :stats_data do
    let(:params) { { statsDataId: '0003014522', limit: 10 } }
    it 'with_valid_app_id' do
      expect(valid_client.stats_data(params)).to include('GET_STATS_DATA')
    end
  end
end
