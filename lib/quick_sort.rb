require 'byebug'
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    # debugger
    pivot_idx = QuickSort.partition(array, start, length, &prc)
    QuickSort.sort2!(array, start, pivot_idx - start)
    QuickSort.sort2!(array, pivot_idx + 1, length - pivot_idx)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    pivot = start
    # debugger
    (start + 1).upto(start + length - 1) do |idx|
      if prc.call(array[pivot], array[idx]) == 1
        if idx - pivot > 1
          QuickSort.switch(array, pivot + 1, idx)
          QuickSort.switch(array, pivot, pivot + 1)
        else
          QuickSort.switch(array, pivot, idx)
        end
        pivot +=1
      end
    end

    pivot
  end

  def self.switch(array, i, j)
    array[i], array[j] = array[j], array[i]
  end
end
