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

% I think that the thead word is wating for the assignment in another thead, this is usefull because you can 
% decide what should happen at assignment before it is happening. The Y = X shoud assign the value of X to Y