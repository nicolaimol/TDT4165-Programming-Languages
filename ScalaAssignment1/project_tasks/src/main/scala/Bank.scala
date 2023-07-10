class Bank(val allowedAttempts: Integer = 3) {

    private val transactionQueue: TransactionQueue = new TransactionQueue()
    private val processedTransactions: TransactionQueue = new TransactionQueue()

    def addTransactionToQueue(from: Account, to: Account, amount: Double): Unit =  {
        val transaction = new Transaction(transactionQueue, processedTransactions, from, to, amount, allowedAttempts)
        transactionQueue.push(transaction)

        val thread = new Thread{
            override def run(): Unit = {
                processTransactions
            }
        }
        thread.start()
        // TODO
        // project task 2
        // create a new transaction object and put it in the queue
        // spawn a thread that calls processTransactions
    }

    // TODO
    // project task 2
    // Function that pops a transaction from the queue
    // and spawns a thread to execute the transaction.
    // Finally do the appropriate thing, depending on whether
    // the transaction succeeded or not
    private def processTransactions: Unit = this.synchronized {
        while (!transactionQueue.isEmpty) {
            val transaction = transactionQueue.pop
            new Thread(transaction).start()

            if (transaction.status == TransactionStatus.PENDING) {
                transactionQueue.push(transaction)
            }
            else {
                processedTransactions.push(transaction)
            }


        }
    }


    def addAccount(initialBalance: Double): Account = {
        new Account(this, initialBalance)
    }

    def getProcessedTransactionsAsList: List[Transaction] = {
        processedTransactions.iterator.toList
    }

}
