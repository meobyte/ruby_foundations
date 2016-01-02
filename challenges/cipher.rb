class Cipher
  attr_reader :key
  ALPHABET = ('a'..'z').to_s

  def initialize(key=nil)
    @key = ('a'..'z').to_a.join('')
  end

  def encode(text)
    text.tr(ALPHABET, key)
  end
end