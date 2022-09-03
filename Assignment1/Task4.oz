local Max PrintGreater in
   fun {Max Number1 Number2}
      if Number1 < Number2 then
	      Number2
      else
	      Number1
      end
   end

   proc {PrintGreater Number1 Number2}
      if Number1 < Number2 then
	      {Show Number2}
      else
	      {Show Number1}
      end
   end

   {Show {Max 10 5}}


   {PrintGreater 10 20}
end
