local Length in
   fun {Length List}
      if List.2 == nil then
         1
      else
         1 + {Length List.2}
      end
   end

   {Show {Length [1 2 3]}}

end

local Take in

   fun {Take List Count}
      if {And Count > 0 List.2 \= nil } then 
         List.1 | {Take List.2 Count-1}
      else
         nil
      end
   end

   {Show {Take [1 2 3 4] 2}}
end

local Drop in
   fun {Drop List Count}
      if {And Count > 0 List.2 \= nil } then 
         {Drop List.2 Count-1}
      elseif Count == 0 then
         List
      else
         nil
      end
   end

   {Show {Drop [1 2 3 4] 2}}
end

local Append in
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

   {Show {Append [1 2 3] [4 5 6]}}
end

local Member in
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

   {Show {Member [1 2 4] 4}}
end


local Position in
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

   {Show {Position [1 3 5 7 9] 9}}
end