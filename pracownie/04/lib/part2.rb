module Enumerable
  def to_hist
    inject(Hash.new(0)) { |memo,x| memo[x] += 1; memo }
  end
end
