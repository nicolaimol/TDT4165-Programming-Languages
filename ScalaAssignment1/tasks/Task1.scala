object Task1 {
  def main(args: Array[String]) = {
   println(fibonacci(5))
  }

  def a(): Array[Int] = {
    val array = new Array[Int](50)
    for (i <- 1 to 50){
        array(i - 1) = i
    }
    return array
  }

  def b(list: Array[Int]): Int = {
    var sum = 0
    for (i <- list) {
        sum += i
    }

    return sum
  }

  def c(list: Array[Int]): Int = {
    if (list.length == 0) 0
    else list.head + c(list.tail)
  }

  def fibonacci(number: Int): BigInt = {
    if (number <= 2) 1
    else fibonacci(number - 1) + fibonacci(number - 2)
  }


}
