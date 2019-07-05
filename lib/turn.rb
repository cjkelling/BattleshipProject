class Turn

def render_name
  if @render == "M"
    puts "was a miss"
  elsif @render == "H"
    puts "was a hit"
  elsif @render == "X"
    puts "sunk their #{ship.name}"
  end
end

end
