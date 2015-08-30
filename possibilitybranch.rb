require "./mapunit"

class PossibilityBranch < Mapunit
  attr_reader :next, :last

  def initialize map, x, y, last
    super map, x, y
    @last = last
    @next = []
  end

  def += node
    @next.append node
  end
end