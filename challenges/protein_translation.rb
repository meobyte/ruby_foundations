class InvalidCodonError < StandardError; end

class Translation
  CODONS = {
    'AUG' => 'Methionine',
    'UGG' => 'Tryptophan',
    'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
    'UAU' => 'Tyrosine',      'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',      'UGC' => 'Cysteine',
    'UUA' => 'Leucine',       'UUG' => 'Leucine',
    'UCU' => 'Serine',        'UCC' => 'Serine',
    'UCA' => 'Serine',        'UCG' => 'Serine',
    'UAA' => 'STOP',          'UAG' => 'STOP',
    'UGA' => 'STOP'
  }

  def self.of_codon(codon)
    CODONS.fetch(codon) { fail InvalidCodonError }
  end

  def self.of_rna(strand)
    codons = strand.scan(/.{3}/)
    codons.each_with_object([]) do |codon, rna|
      return rna if of_codon(codon) == 'STOP'
      rna << of_codon(codon)
    end
  end
end
