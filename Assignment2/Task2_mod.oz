fun {ExpressionTree Tokens} ExpressionTreeInternal in

    fun {ExpressionTreeInternal Tokens ExpressionStack}
        %Takes the number from the number(X) and adds to stack
        case Tokens of number(X)|Tail then
            {ExpressionTreeInternal Tail X|ExpressionStack}

        %Takes the two first tokens from stack and uses them with the operator
        [] operator(type:operator)|Tail then
        case ExpressionStack of First|Secound|Rest then
            {ExpressionTreeInternal Tail operator(First Secound)|Rest}
        end
        
        [] nil then
        %Returns the Expressionstack 
            ExpressionStack
        end
        
    end
    %The first item in the list is returned.
    {ExpressionTreeInternal Tokens nil}.1
    
end