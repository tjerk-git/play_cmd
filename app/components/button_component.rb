# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  attr_accessor :type

  PRIMARY_CLASSES = %w[
    border border-transparent
    text-white
    bg-gray-800 hover:bg-gray-700
    focus:outline-none
    focus:ring-2 focus:ring-offset-2 focus:ring-gray-500
  ].freeze
  OUTLINE_CLASSES = %w[
    text-gray-900
    border border-gray-900
    bg-transparent hover:bg-gray-200
    focus:outline-none
    focus:ring-2 focus:ring-offset-2 focus:ring-gray-500
  ].freeze
  DANGER_CLASSES = %w[
    text-white
    bg-red-600 hover:bg-red-700
    border border-red-600
    focus:outline-none
    focus:ring-2 focus:ring-offset-2 focus:ring-red-500
  ].freeze
  BASE_CLASSES = %w[
    inline-flex
    items-center
    px-4 py-2
    text-sm font-medium
    rounded-md
    shadow-sm
  ].freeze

  BUTTON_TYPE_MAPPINGS = {
    primary: PRIMARY_CLASSES,
    danger: DANGER_CLASSES,
    outline: OUTLINE_CLASSES
  }.freeze

  def initialize(type: :primary)
    @type = type
  end

  def classes
    (BUTTON_TYPE_MAPPINGS[@type] + BASE_CLASSES).join(' ')
  end

end
