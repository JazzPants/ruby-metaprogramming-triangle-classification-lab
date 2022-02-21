class Triangle
  # write code here
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    check_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def check_triangle
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]

    #[true, true, true] for example a=2,b=2,c=2 (2+2 > 2 is true etc.)
    p real_triangle

    #error handler, push in a falsey value for each invalid side
    # [a, b, c].each do |side|
    #   real_triangle << false if side <= 0

    raise TriangleError if real_triangle.include?(false)
    # end
  end

  class TriangleError < StandardError
  end
end

# real_triangle = Triangle.new(2, 2, 2)
# p real_triangle.kind

# fake_triangle = Triangle.new(0, 0, 0)
# fake_triangle.kind
