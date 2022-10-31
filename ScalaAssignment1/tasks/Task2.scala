import java.util.concurrent.atomic.AtomicInteger

object Task2 extends  App {
    // make counter thread safe

    private var counter: AtomicInteger = AtomicInteger(0)


    def main(args: Array[String]) = {

        val threads = Array[Thread](
            makeThread(increaseCounter()), 
            makeThread(increaseCounter()), 
            makeThread(printCounter()),
        )
        
        for (i <- threads) {
            i.start()
        }

        for (i <- threads) {
            i.join()
        }
    }

    def makeThread(function: => Unit): Thread = {
        val thread = new Thread {
            override def run = function
        }

        thread
    }

    def printCounter(): Unit = counter.synchronized {
        println(counter.get())
    }

    
    def increaseCounter(): Unit = counter.synchronized {
        counter.getAndAdd(1)
    }

}
