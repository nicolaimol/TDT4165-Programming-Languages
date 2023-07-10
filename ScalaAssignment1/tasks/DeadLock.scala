object DeadLock extends App { self => 
    lazy val x: Int = {
        val thread = new Thread (){
            override def run() = self.synchronized {}
        }
        thread.start();
        thread.join();  
        1
    }

    println(DeadLock.x);
}