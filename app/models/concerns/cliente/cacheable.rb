class Cliente < ActiveRecord::Base
  module Cacheable
    extend ActiveSupport::Concern

    included do
      after_commit :flush_id_cache
    end

    def flush_id_cache
      Rails.cache.delete [self.class.name, "identificacion", identificacion]
    end

    module ClassMethods
      def cached_find_by_identificacion(identificacion)
        if identificacion.blank? then return end
        Rails.cache.fetch([name, "identificacion", identificacion]) do
          logger.debug "caching identificacion: #{identificacion}"
          find_by identificacion: identificacion
        end
      end
      def cached_search_for_identificacion(identificacion)
        # returns an array with one record (used by ember-data#search)
        [cached_find_by_identificacion(identificacion)].compact
      end
    end
  end
end
