require 'dry-validation'

class SiswaValidator < Dry::Validation::Contract
  params do
    required(:nis).value(:integer)
    required(:nama).value(:string)
    required(:jurusan).value(:string)
    required(:alamat).value(:string)
    required(:kelas).value(:integer)
  end

  rule(:nis) do
    key.failure("Must have a length of 6") unless value.to_s.length == 6
  end

  rule(:nama) do
    key.failure("The data is too long, it should not exceed 100") if value.length > 100
  end
end
class NisValidator < Dry::Validation::Contract
  params do
    required(:nis).value(:integer)
  end
  rule(:nis) do
    key.failure("Must have a length of 6") unless value.to_s.length == 6
  end
end
class SiswaOptValidator < Dry::Validation::Contract
  params do
    optional(:nis).value(:integer)
    optional(:nama).value(:string)
    optional(:jurusan).value(:string)
    optional(:alamat).value(:string)
    optional(:kelas).value(:integer)
  end

  rule(:nis) do
    key.failure("Must have a length of 6") unless value.to_s.length == 6
  end

  rule(:nama) do
    key.failure("The data is too long, it should not exceed 100") if value && value.length > 100
  end
end
