local Push in
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

   {Show {Push [1] 3}}
end

local Peek in
   fun {Peek List}
      if List == nil then
         nil
      else
         List.1
      end
   end

   {Show {Peek [1]}}
end

local Pop in
   fun {Pop List}
      List.2
   end

   {Show {Pop [1 4 6 7]}}
end