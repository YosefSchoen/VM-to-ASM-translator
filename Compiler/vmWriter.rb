def writePush(segment, index)
 str = "push " + segment + index
  return str
end


def writePop(segment, index)
  str = "pop " + segment + index
  return str
end


def writeArithmetic(cmd)
  str = ""
  case cmd
  when "+"
    str = "add\n"

  when "-"
    str = "sub\n"

  when "="
    str = "eq\n"

  when "&gt"
    str = "gt\n"

  when "&lt"
    str = "lt\n"

  when "&amp"
    str = "and\n"

  when "|"
    str = "or\n"

  when "~"
    str = "not\n"

  else
    # type code here
  end

  return str
end


def writeLabel(label)
  str = "label " + label + "\n"
  return str
end


def writeGoTo(label)

  str = "goto " + label + "\n"
  return str

end


def writeIf(label)
  str = "if-goto " + label + "\n"
  return str
end


def writeCall(name, nArgs)
  str = "call " + name + " " + nArgs + "\n"
  return str
end


def writeFunction(name, nLocals)
  str = "function " + name + " " + nLocals
  return str
end


def writeReturn
  str = "return" + "\n"
  return str
end


def close

end





