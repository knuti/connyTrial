class Cipher
  class << self
    def rot13(message)
      message.tr("a-zA-Z", "n-za-mN-ZA-m")
    end
  end
end
