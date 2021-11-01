words = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings (str,ref)
  str.downcase!
  ans = Hash.new(0)
  ref.each { |word| ans[word] += str.split(word).length-1 if str.include? word.downcase } 
  ans
end

p substrings("Howdy partner, sit down! How's it going?", words)