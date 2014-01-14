class StaticPagesController < ApplicationController
  def home
  end

  def about
  end
  
  def part2
  end
  
  def checkerboard
    @squares = [*1..100]
  end
end
