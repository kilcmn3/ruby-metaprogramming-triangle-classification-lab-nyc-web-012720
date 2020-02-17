class Triangle
  attr_accessor :side_1 , :side_2, :base
  # write code here
  def initialize(side_1, side_2, base)
   @side_1 = side_1
   @side_2 = side_2
   @base = base
  end

  def kind
    validate_triangle
  if side_1 ==  side_2 && side_2 == base 
    :equilateral
  elsif side_1 == side_2 || side_2 == base || side_1 == base 
    :isosceles
  else
    :scalene
  end
  end

  def validate_triangle
    real_triangle = [(side_1+side_2 > base),(side_1+base > side_2),(side_2+base > side_1)]
    [side_1, side_2, base].each do |val|
      real_triangle << false if val <= 0
      raise TriangleError if real_triangle.include?(false)
    end
  end
  class TriangleError < StandardError
    
  end
end
