module Enumerable
  def sort_by_freq
    hist = inject(Hash.new(0)) do |memo,x|
      memo[x] += 1
      memo
    end
    sort_by { |x| [hist[x], x] }
  end

  def sort_distinct_by_freq
    hist = inject(Hash.new(0)) do |memo,x|
      memo[x] += 1
      memo
    end
    hist.keys.sort_by { |x| [hist[x], x] }
  end
end
