# 二つのベクトル間のコサイン類似度を計算する
def cosine_similarity(vec1, vec2)
  # ドット積の計算
  dot_product = vec1.zip(vec2).map { |a, b| a * b }.sum

  # ベクトルの大きさ（マグニチュード）の計算
  magnitude1 = Math.sqrt(vec1.map { |x| x**2 }.sum)
  magnitude2 = Math.sqrt(vec2.map { |x| x**2 }.sum)
  dot_product / (magnitude1 * magnitude2)
end
  
def top_2_similar_arrays(base_array, arrays)
  similarities = arrays.reject { |arr| arr == base_array }
                        .map do |arr| 
                          puts arr
                          puts cosine_similarity(base_array, arr)
                          [arr, cosine_similarity(base_array, arr)] 
                        end

  similarities.sort_by { |_, sim| -sim }.first(2).map(&:first)
end
  
# 使用例
base_array = [1.0, 2.0, 3.0]
arrays = [
  [1.0, 2.0, 3.0],
  [2.0, 3.0, 4.0],
  [1.0, 2.0, 2.5],
  [2.0, 5.0, 7.0]
]

puts top_2_similar_arrays(base_array, arrays).inspect
