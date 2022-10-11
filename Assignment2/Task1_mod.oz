fun {Lex Str}
        {String.tokens Str & }
    end

    fun {Tokenize Lexeme} Token in
        case Lexeme of Head|Tail then 
            case Head of "+" then 
                operator(type:plus)|{Tokenize Tail}
            [] "-" then 
                operator(type:minus)|{Tokenize Tail}
            [] "*" then 
                operator(type:multiply)|{Tokenize Tail}
            [] "/" then 
                operator(type:divide)|{Tokenize Tail}
            [] "p" then
                command(print)|{Tokenize Tail}
            [] "d" then 
                command(duplicate)|{Tokenize Tail}
            [] "i" then 
                command(inverse)|{Tokenize Tail}
            [] "c" then
                command(clear)|{Tokenize Tail}
            else % Last posible is number
                number({String.toFloat Head})|{Tokenize Tail} 
            end
        else 
            nil 
        end
    end

    fun {Interpret Tokens} Operators Commands InterpretTokens Stack in

        fun{InterpretTokens Tokens Stack}

            %Putting the number first in the stack
            case Tokens of number(X)|Tail then
            {InterpretTokens Tail X|Stack}

            [] command(C)|Tail then
            %Running the right command on the stack
            {InterpretTokens Tail {ExcecuteCommand C Stack}}

            
            %Taking the two first elements of the stack and do the right operation on them, then put the result first in the stack
            
            [] operator(type:O)|Tail then
                case Stack of First|Second|RestStack then
                    {InterpretTokens Tail {ExcecuteOperation O Second First}|RestStack}
                end
            [] nil then
                Stack
            end
        end

        {InterpretTokens Tokens nil}
    end

    fun {ExcecuteOperation Operation Num1 Num2}
        case Operation of plus then 
            Num1 + Num2
        [] minus then
            Num1 - Num2
        [] divide then
            Num1 / Num2
        [] multiply then 
            Num1 * Num2
        end
    end

    fun {ExcecuteCommand Command Stack}
        case Command of print then
            {System.show Stack}
            Stack
        [] inverse then
            case Stack of First|Rest then
                ~First|Rest
            else nil
            end
        [] duplicate then
            case Stack of First|Rest then
                First|First|Rest
            else 
                nil
            end
        [] clear then
            nil
        else
            nil
        end
    end