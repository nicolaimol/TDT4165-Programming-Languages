import exceptions._

import java.util.concurrent.atomic.AtomicReference
import scala.collection.mutable.Queue
import scala.util.control.Breaks.break

object TransactionStatus extends Enumeration {
  val SUCCESS, PENDING, FAILED = Value
}

class TransactionQueue {

  // TODO
  // project task 1.1
  // Add datastructure to contain the transactions

  val transactionQueue = new Queue[Transaction]()

  // Remove and return the first element from the queue
  def pop: Transaction = this.synchronized {
    return transactionQueue.dequeue()
  }

  // Return whether the queue is empty
  def isEmpty: Boolean = this.synchronized {
    return transactionQueue.isEmpty
  }

  // Add new element to the back of the queue
  def push(t: Transaction): Unit = this.synchronized {
    transactionQueue.enqueue(t)
  }

  // Return the first element from the queue without removing it
  def peek: Transaction = this.synchronized {
    return transactionQueue.front
  }

  // Return an iterator to allow you to iterate over the queue
  def iterator: Iterator[Transaction] = this.synchronized {
    return transactionQueue.iterator
  }
}

class Transaction(val transactionsQueue: TransactionQueue,
                  val processedTransactions: TransactionQueue,
                  val from: Account,
                  val to: Account,
                  val amount: Double,
                  val allowedAttemps: Int)
  extends Runnable {
  var status: TransactionStatus.Value = TransactionStatus.PENDING
  var attempt = 0

  def getStatus: TransactionStatus.Value = this.synchronized {
    return status
  }

  def setStatus(newStatus: TransactionStatus.Value): Unit = this.synchronized {
    status = newStatus
  }

  override def run: Unit = {

    def doTransaction(): Either[Unit, String] = this.synchronized {
      // TODO - project task 3
      // Extend this method to satisfy requirements.
      val result = from.withdraw(amount)
      result match {
        case Left(value) => {
          to.deposit(amount)
          setStatus(TransactionStatus.SUCCESS)
          return Left()
        }
        case Right(value) => {
          return Right(value)
        }
      }

    }

    // TODO - project task 3
    // make the code below thread safe
    while (attempt < allowedAttemps && getStatus == TransactionStatus.PENDING) {
      attempt += 1
      val result = doTransaction()
      result match {
        case Left(value) => {}
        case Right(value) =>
          print(value)

      }
      Thread.sleep(100) // you might want this to make more room for
      // new transactions to be added to the queue

    }

    if (getStatus == TransactionStatus.PENDING) {
      setStatus(TransactionStatus.FAILED)
    }

  }
}
