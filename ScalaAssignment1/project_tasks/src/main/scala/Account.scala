import exceptions._

class Account(val bank: Bank, initialBalance: Double) {

    class Balance(var amount: Double) {}

    val balance = new Balance(initialBalance)

    // TODO
    // for project task 1.2: implement functions
    // for project task 1.3: change return type and update function bodies
    def withdraw(amount: Double): Either[Unit, String] = this.synchronized {
        if (amount < 0) {
            return Right("Cannot withdraw negative amount")
        }
        if (amount > balance.amount) {
            return Right("Cannot withdraw more than balance")
        }
        balance.amount -= amount
        Left()
    }
    def deposit (amount: Double): Either[Unit, String] = this.synchronized {
        if (amount < 0) {
            return Right("Cannot deposit negative amount")
        }
        balance.amount += amount
        return Left()
    }
    def getBalanceAmount: Double = this.synchronized {balance.amount}

    def transferTo(account: Account, amount: Double) = {
        bank addTransactionToQueue (this, account, amount)
    }


}
