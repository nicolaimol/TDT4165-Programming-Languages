/*

In a tail recursive function each function call is the "last thing" in the calling function (nothing remains to be done after the calls return).
This was not the case for my implementation of Sum in task 2.

 */

fun {TailSum List}
    fun {TailSumTail List Sum}
        case List of Head|Tail then
            {TailSumTail Tail Head + Sum}
        else
            Sum
        end
    end
in
    {TailSumTail List 0}
end

/* 
b) 
    in oz tail recursion is beneficial because of the ability to implement functions with unbound variables. 
    these variables will be assigned at runtime of function, therefore Oz can recognize patterns and skip steps in the calculations.
    this will save us memory and increase performance.

c)
    runtime wise i will say that all languages benefits from this, however languages made with good debuging can be harmed by this because
    of the fact that it eliminates the backtrack possibility.
*/