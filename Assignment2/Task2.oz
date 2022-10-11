functor
import
    System
    Application(exit:Exit)
define

    \insert Task1_mod.oz
    \insert Task2_mod.oz


    {System.showInfo "\nTask 2"}
    {System.printInfo "2a: "}{System.show {ExpressionTree [number(2) number(3) operator(type:plus) number(5) operator(type:divide)]}} %2a
    {System.printInfo "2b: "}{System.show {ExpressionTree {Tokenize {Lex "3 10 9 * - 7 +"}}}} % 2b

    {Exit 0}
end