# help method
inner_product = lambda { |v1, v2|
  raise if v1.size != v2.size

  v1.zip(v2).reduce(0) { |memo, p| memo += p[0] * p[1] }
}

l = 150_0000

cache = Hash.new

# linear transformation matrix
transformation = [
  [[-1, 2, 2], [-2, 1, 2], [-2, 2, 3]],
  [[1, 2, 2], [2, 1, 2], [2, 2, 3]],
  [[1, -2, 2], [2, -1, 2], [2, -2, 3]]
]

# keep triple tree search elems, and seed the queue
queue = Array.new
queue.push [3, 4, 5]

until queue.empty?
  triple = queue.shift # pop queue
  base = triple.reduce(:+)
  # push queue
  if base <= l
    x, y, z = transformation.map { |t|
      t.map { |v| inner_product.call(v, triple) }
    }
    queue.push(x, y, z)
  end
  # update cache
  d = base
  until d > l
    cache[d] ||= 0
    cache[d] += 1
    d += base
  end
end

puts cache.count { |k ,v| k <=l && v == 1 }
