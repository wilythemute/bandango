class SustentoComprobante < ActiveRecord::Base
  module Caching
    extend ActiveSupport::Concern

    included do
      after_commit :flush_views_cache
    end

    def flush_views_cache
      Rails.cache.delete "views/" + self.class.index_cache_view_key
    end

    module ClassMethods
      def index_cache_view_key
        "api/sustento_comprobantes.json"
      end
    end
  end  
end
