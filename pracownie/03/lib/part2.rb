VOWELS = ['A', 'E', 'I', 'O', 'U']

def hello(name)
  "Hello, " + name
end

def starts_with_vowel?(s)
  VOWELS.include?(s.capitalize[0])
end

def binary_multiple_of_4?(s)
  s[-2..-1] == "00"
end
