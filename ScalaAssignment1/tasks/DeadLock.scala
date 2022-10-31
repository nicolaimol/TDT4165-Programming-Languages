object DeadLock extends App {

    def thread(body: =>Unit): Thread = {
        val t = new Thread {
            override def run() = body
        }
        t.start()
        t 
    }

    class Account(val name: String, var money: Int){

        def add(account: Account, n: Int) = account.synchronized {
            account.money += n
            if (n > 10) logTransfer(account.name, n)
        }
    }

    def send(a: Account, b: Account, n: Int) = a.synchronized {
        b.synchronized {
            a.money -= n
            b.money += n
        } 
    }

    import scala.collection._
    private val transfers = mutable.ArrayBuffer[String]()
    def logTransfer(name: String, n: Int) = transfers.synchronized {
        transfers += s"transfer to account '$name' = $n"
    }

    val a = new Account("Jack", 1000)
    val b = new Account("Jill", 2000)
    val t1 = thread { for (i<- 0 until 100) send(a, b, 1) }
    val t2 = thread { for (i<- 0 until 100) send(b, a, 1) }
    t1.join(); t2.join()
    println(s"a = ${a.money}, b = ${b.money}")

    
}