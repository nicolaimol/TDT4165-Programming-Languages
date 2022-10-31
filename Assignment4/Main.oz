functor
import
    System
    Application(exit:Exit)
define
    \insert Task2.oz
    \insert Task3.oz
    \insert Task4.oz

    {System.show 'Task2'}
    {System.show {List.take {Enumerate 1 5} 5}}
    {System.show {GenerateOdd 1 5}}
    {System.show {GenerateOdd 4 4}}

    {System.show 'Task3'}
    {System.show {ListDivisorsOf 6}}
    {System.show {ListPrimesUntil 12}}

    {System.show 'Task4'}
    {System.show {List.take {EnumerateLazy} 10}}
    {System.show {List.take {PrimesLazy} 10}}


end