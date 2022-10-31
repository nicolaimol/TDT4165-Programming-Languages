
fun {ListDivisorsOf Number}
    local PosibleDivisors in 
        PosibleDivisors = {Enumerate 1 Number }
        {Filter PosibleDivisors fun {$ Var}
            
            (Number mod Var) == 0 end}
    end
end

fun {ListPrimesUntil N}
    local Numbers in
        Numbers = {Enumerate 2 N}
        
        {Filter Numbers fun {$ Var}
            {ListDivisorsOf Var} == [1 Var] end}
    end
end
