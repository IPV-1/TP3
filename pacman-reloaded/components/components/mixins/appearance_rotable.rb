require 'active_support/concern'

module AppearanceRotable
  extend ActiveSupport::Concern
  included do
    attr_accessor :original_appearance
  end

end