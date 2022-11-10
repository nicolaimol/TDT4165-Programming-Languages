% Implement a function fun {Enumerate Start End} that generates, asynchronously, 
% a stream of numbers from Start until End.

fun {Enumerate Start End} 
    local Tail in
        if Start =< End then
            
                Tail = thread {Enumerate (Start+1) End} end
            

            Start | {List.take Tail End-Start}
        else
            nil
        end
    end
end

fun {GenerateOdd Start End} List in
    List = {Enumerate Start End}

    {Filter List Int.isOdd}
end
