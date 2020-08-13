# frozen_string_literal: true

def interleave_arrays(a, b)
  arr = []
  observed = a
  other = b
  temp = []

  while observed.length.positive?
    arr.push(observed.delete_at(0))
    temp = observed
    observed = other
    other = temp
  end

  arr += other.length.positive? ? other : []
  arr
end
