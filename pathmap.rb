class Pathmap
  attr_reader :width, :height

  def initialize width, height
    @width, @height = width, height

    @nodes = Array.new(@height).map.with_index do |elem, x|
      Array.new(@width).map.with_index do |rawr, y|
        MapUnit.new(self, x, y)
      end
    end
  end

  def [] x
    @nodes[x]
  end

  def display
    lines = Array.new(@height * 3, "")
    @height.times do |y|
      @width.times do |x|
        3.times do |i|
          lines[y*3 + i] += @nodes[y][x].display(i)
        end
      end
    end

    lines[-2][-2] = "x"
    lines[1][1]   = "b"

    lines.join("\n").gsub("*", "\u2588") + "\n"
  end

  def complete?
    @nodes.flatten.all? { |e| e.filled? }
  end
end