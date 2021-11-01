module Interface
  class ModalComponent < ViewComponent::Base

    def initialize(size: "max-w-lg")
      @size = size
    end

  end
end