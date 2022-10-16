object Task2 {
    private var counter: Int = 0


    def main(args: Array[String]) = {
        val threads = Array[Thread](
            makeThread(increaseCounter()), 
            makeThread(increaseCounter()), 
            makeThread(printCounter())
        n)
        
        for (i <- threads) {
            i.start()
        }
    }

    def makeThread(function: => Unit): Thread = {
        val thread = new Thread {
            override def run = function
        }

        thread
    }

    def printCounter(): Unit = {
        println(counter)
    }

    def increaseCounter(): Unit = {
        counter += 1 
    }

}
