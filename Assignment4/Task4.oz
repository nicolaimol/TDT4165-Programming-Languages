fun lazy {EnumerateLazy} EnumerateInner in
    fun lazy {EnumerateInner N}
        N | {EnumerateInner N + 1}
    end

    {EnumerateInner 1}
end

fun lazy {PrimesLazy}
    local FilterLazy in
        fun lazy {FilterLazy Numbers Function}
            case Numbers of Head|Tail then
                if {Function Head} then
                    Head | {FilterLazy Tail Function}
                else
                    {FilterLazy Tail Function}
                end
            else nil
            end
        end

        {FilterLazy {EnumerateLazy} fun {$ Var}
            {ListDivisorsOf Var} == [1 Var] end}
    end
    
end
