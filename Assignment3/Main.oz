functor
import
    System
    Application(exit:Exit)
define

    \insert Task1.oz
    \insert Task2.oz
    \insert Task3.oz
    \insert Task4.oz
    \insert Task5.oz

    {System.showInfo "\nTask 1"}
    {System.showInfo "b)"}
    local RealSol X1 X2 in
        {QuadraticEquation 2.0 1.0 ~1.0 RealSol X1 X2}
        {System.show [RealSol X1 X2]}
    end

    local RealSol X1 X2 in
        {QuadraticEquation 2.0 1.0 2.0 RealSol X1 X2}
        {System.show [RealSol X1 X2]}
    end

    {System.showInfo "\nTask 2"}
    {System.showInfo {Sum [1 2 3 4]}}

    {System.showInfo "\nTask 3"}
    {System.showInfo {FoldLength [1 2 3 4]}}
    {System.showInfo {FoldSum [1 2 3 4]}}


    {System.showInfo "\nTask 4"}
    {System.show {{Quadratic 3 2 1} 2}}

    {System.showInfo "\nTask 5"}
    {System.show {LazyNumberGenerator 0}.1}
    {System.show {{LazyNumberGenerator 0}.2}.1}
    {System.show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1}
end