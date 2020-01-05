#terminal come in 5 types they will all be stored in an array called terminals

def getKeywords
  dataTypes = %w(int char boolean)
  functionTypes = %w(constructor function method)
  classDataTypes = %w(field static)
  keyConstants = %w(true false null this)
  otherKeyWords = %w(class var void  let do if else while return)
  keywords = [].concat(dataTypes, functionTypes, classDataTypes, keyConstants, otherKeyWords)
  return keywords
end


def getSymbols
  symbols = %w({ } ( ) [ ] . , ; + - * / & | < > = ~)
  return symbols
end


def getTerminals
  terminals = [getKeywords, getSymbols]
  return terminals
end


def getAlphabet
  #the alphabet has 2 types they will all be stored in an array called alphabet
  digits = %w(0 1 2 3 4 5 6 7 8 9 )
  characters = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z _ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  alphabet = [digits, characters]
  return alphabet
end




def readJackFile(fileName)
  lines = []

  #new read only file object with the filename passed above
  inFile = File.new(fileName, "r")

  while (line = inFile.gets)
    lines << line
  end

  inFile.close

  #returns an array each element is a string of a line of the file
  return lines

end



def tokenize(fileName, terminals, alphabet)
  tokens = []
  keyWords = terminals[0]
  symbols = terminals[1]


  lines = readJackFile(fileName)

  lines.each do |line| line = line.split(' ')

    line.each do |str|

      if keyWords.include?(str)
        token = ["keyword", str]
        tokens.append(token)

      elsif symbols.include?(str)
        token = ["symbol", str]
        tokens.append(token)

      elsif isIntConstant(str)
        token = ["integerConstants", str]
        tokens.append(token)

      elsif isStringConstant(str)
        token = ["stringConstants", str]
        tokens.append(token)

      elsif isIdentifier(str, alphabet, keyWords)
        token = ["stringConstants", str]
        tokens.append(token)
      end
    end
  end

  return tokens
end

#function to check if a character is a number
def isIntConstant(i)
  if i == "0" or i.to_i > 0
    return (i.to_i >= 0 and i.to_i < 2**15) # 2^15 is maximum integer in JACK
  end

  return false
end

#function to check if a character is a string
def isStringConstant(str)
  return (str[0].to_s == "\"" and str[str.to_s.size - 1].to_s == "\"") #if statement surrounded by quotation marks of any kinds

  return false
end


#function to check if a string is a legal id
# make sue each id is in our alphabet
def isIdentifier(str, alphabet, keyWords)
  digitsOfAlphabet = alphabet[0] # if its a digit
  charsOfAlphabet = alphabet[1] # if a letter

  # first character in name cannot be digit
  if digitsOfAlphabet.include?(str[0])
    return false
  end

  # if keyword includes str
  if keyWords.include?(str)
    return false
  end


  # check is in the alphabet
  for i in 1..str.size-1
    character = str[i]

    unless digitsOfAlphabet.include?(character) or charsOfAlphabet.include?(character)
      return false
    end
  end

  return true
end

