class InvalidCodonError < StandardError; end

class Translation
  CODONS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine', 'UUG' => 'Leucine',
    'UCU' => 'Serine', 'UCC' => 'Serine', 'UCA' => 'Serine', 'UCG' => 'Serine',
    'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP'
  }

  def self.of_codon(codon)
    unless CODONS.key?(codon)
      fail InvalidCodonError
    end
    CODONS.fetch(codon)
  end

  def self.of_rna(strand)
    codons = strand.scan(/.{3}/)
    rna = []
    codons.each do |codon|
      break if of_codon(codon) == 'STOP'
      rna << of_codon(codon)
    end
    rna
  end
end
