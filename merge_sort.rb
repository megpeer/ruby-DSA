# if arr contain only one number
# return arr

# else
# divide up left half of numbers
# divide up right half of numbers
# merge sorted halves
# 
#if left is empty, return right
#if right empty, return left
#if left <= right tal=ke left
#else take right
#recursively merge, concat to new array





class MergeSort

def sort(arr)
  if arr.one?
    return arr
  else
    half = arr.length / 2
    left = arr.take(half)
    right = arr.drop(half)
    sorted_left = sort(right)
    sorted_right = sort(left)
    merge(sorted_left, sorted_right)
  end
end


def merge(left, right)
  if left.empty?
    return right
  elsif right.empty?
    return left
  end
    smallest_number = if (left.first <= right.first)
    left.shift
    else right.shift
  end
    recursive = merge(left, right)
    [smallest_number].concat(recursive)
  end
end
# arr = [3, 2, 1, 13, 8, 5, 0, 1]
# 
# arr = [105, 79, 100, 110]

merge_sort = MergeSort.new
puts merge_sort.sort([105, 79, 100, 110])
