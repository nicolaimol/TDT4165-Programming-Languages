functor
import
    System
    Application(exit:Exit)
define

    \insert Task1_mod.oz

    

    {System.showInfo "\nTask 1"}
    {System.printInfo "1a: "}{System.show {Lex "1 2 + 3 *"}} %1a
    {System.printInfo "1b: "}{System.show {Tokenize ["1" "2" "+" "3" "*"]}} %1b
    {System.printInfo "1c: "}{System.show {Interpret {Tokenize {Lex "1 2 3 +"}}}} %1c
    {System.printInfo "1d: "}{System.show {Interpret {Tokenize {Lex "1 2 p 3 +"}}}} %1d
    {System.printInfo "1e: "}{System.show {Interpret {Tokenize {Lex "1 2 3 + d"}}}} %1e
    {System.printInfo "1f: "}{System.show {Interpret {Tokenize {Lex "1 2 3 + i"}}}} %1f
    {System.printInfo "1g: "}{System.show {Interpret {Tokenize {Lex "3 2 4 + d c 3"}}}} %1g

    {Exit 0}

end