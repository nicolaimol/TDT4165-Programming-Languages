fun {LazyNumberGenerator StartValue}
    StartValue|fun {$} {LazyNumberGenerator StartValue + 1} end
end

/* 
b)
    Startvalue could be of any type that suports + operation
    we sets this value as head and the tail to the retrunr of the same method with startvalue + 1
    this makes the list be as long as we want it to be
    this is done by making it lazy

    as each time we ad a .2 we make the list longer than the last list
    we and with a .1 to get the value we want, and not the list
*/