%declare Length Take Drop Append Member Position Push Peek Pop in
fun {Length List}
   if List.2 == nil then
      1
   else
      1 + {Length List.2}
   end
end

fun {Take List Count}
   if {And Count > 0 List.2 \= nil } then 
      List.1 | {Take List.2 Count-1}
   else
      nil
   end
end

fun {Drop List Count}
   if {And Count > 0 List.2 \= nil } then 
      {Drop List.2 Count-1}
   elseif Count == 0 then
      List
   else
      nil
   end
end

fun {Append List1 List2}
   if List1 \= nil  then 
      List1.1 | {Append List1.2 List2}
   else
      if List2 \= nil then
         if List2.1 \= nil then
            List2.1 | {Append List1 List2.2}
         end
      else
         nil
      end
   end
end

fun {Member List Element}
   if List == nil then
      false
   else
      if List.1 == Element then
         true
      else
         {Or false {Member List.2 Element}}
      end
   end
end

fun {Position List Element}
   if List == nil then
      ~1
   else
      if List.1 == Element then
         1
      else
         1 + {Position List.2 Element}
      end
   end
end

fun {Push List Element}
   if  Element == nil then
      nil
   else
      if List == nil then
         Element | {Push nil nil}
      else
         Element | {Push List.2 List.1}
      end
   end
end

fun {Peek List}
   if List == nil then
      nil
   else
      List.1
   end
end

fun {Pop List}
   List.2
end

