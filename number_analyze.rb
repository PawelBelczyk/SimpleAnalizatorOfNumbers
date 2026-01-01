
RULES = {
  "Prime" => ->(n) { prime?(n) },
  "Even" => ->(n) { n.even? },
  "Odd" => ->(n) { n.odd? },
  "Square" => -> (n) { square?(n) },
  "Cube" => -> (n) {Math.cbrt(n) % 1 == 0 }
}  

def label(n)
  return [] if n <= 0 

  labels = []
  
  RULES.each do |name, rule|
  labels << name if rule.call(n)
  end
  labels
end





def prime?(n)
  return false if n < 2
  (2..Math.sqrt(n)).each do |i|
    return false if n % i == 0
  end  
  true
end  

def square?(n)
  return false if n < 1
  Math.sqrt(n) % 1 == 0 
end  






def prompt(text)
  print "#{text} "
  gets&.chomp
end

def analyze
  num = prompt("Podaj ostatnią liczbę w zakresie").to_i

  1.upto(num) do |e| 
    puts "#{e} ---> #{label(e).join(", ")}"
  end
end

analyze



def assert(expected, actual)
  if expected == actual
    puts "ok: #{actual}"
  else
    puts "fail: expected #{expected}, got: #{actual}"
  end
end

assert(["Prime", "Even"], label(2))
assert(["Prime", "Odd"], label(3))
assert(["Even", "Square"], label(4))
assert(["Odd", "Square"], label(9))
assert([], label(0))
assert([], label(-5))
