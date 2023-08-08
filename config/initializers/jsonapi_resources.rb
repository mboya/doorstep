JSONAPI.configure do |config|
  config.resource_cache = Rails.cache
  config.resource_key_type = :uuid
  config.default_paginator = :paged
  config.top_level_links_include_pagination = false
  config.default_page_size = 10
  config.maximum_page_size = 50
  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :record_count
  config.top_level_meta_include_page_count = true
  config.top_level_meta_page_count_key = :page_count
  config.allow_transactions = true
  config.default_resource_cache_field = :updated_at
end
