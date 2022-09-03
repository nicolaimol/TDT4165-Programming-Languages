local X Y Z in
   Y = 300
   Z = 30
   X = Y * Z
   {Show X}
end

local X Y in
   X = "This is a string"
   thread {System.showInfo Y} end
   Y = X
end