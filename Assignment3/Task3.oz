fun {RightFold List Op U}               
    case List of Head|Tail then         % Case for when the list is not empty.
        {Op Head {RightFold Tail Op U}} /* We use the anonymous function given as Op
            We recursivly runs the funtcion with head and the returnvalue of recursive function with tail
         */
    else                                % If the list is empty we return U given
        U                               
    end                                 
end

/*
Length implemented with RightFold. 
An anonymous function is passed as a parameter 
We ignore first param as we do not care about head, we only care if there is one, and adds 1 to the same function with tail(Y)
U = 0 we end with no value when list is empty
*/
fun {FoldLength List}
    {RightFold List fun {$ _ Y} 1 + Y end 0}
end

/*
Length implemented with RightFold. 
An anonymous function is passed as a parameter 
We ignore first param as we do  care about head, and adds X to the same function with tail(Y)
U = 0 we end with no value when list is empty
*/
fun {FoldSum List}
    {RightFold List fun {$ X Y} X + Y end 0}
end

/*
d) 
Subtraction and divition is directiondepenendt, as 1-2 and 2-1 are not equal,
same with 1/2 and 2/1

e)
The natural value for U when summing and finding lengt is 0
in sum we do not want to add any value when there are no more values
same for lengt, we do not want to increase lenght when no more values are found

 */
