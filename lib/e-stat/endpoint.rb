module EStat
  module Endpoint
    def stats_list(params = {})
      get('getStatsList', params)
    end

    def meta_info(params = {})
      get('getMetaInfo', params)
    end

    def stats_data(params = {})
      get('getStatsData', params)
    end

    def post_dataset(params = {})
      post('postDataset', params)
    end

    def ref_dataset(params = {})
      get('refDataset', params)
    end

    def data_catalog(params = {})
      get('getDataCatalog', params)
    end
  end
end
