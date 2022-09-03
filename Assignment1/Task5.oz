local Circle in

   proc {Circle R} D C A Pi=355.0/113.0 in
      D = 2.0 * R
      C = Pi * D
      A = Pi * R * R
      {Browse [D C A]}
   end

   {Circle 10.0}
end