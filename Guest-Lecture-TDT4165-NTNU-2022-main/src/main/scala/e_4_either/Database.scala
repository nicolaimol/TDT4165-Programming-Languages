package e_4_either

import scala.collection.mutable.Map as MutMap

trait Database[Value]:
  def saveElement(value: Value): AdId
  def getElement(key: AdId): Option[Value]

object Database:
  def create[Value](): Database[Value] =
    new Database[Value]:
      val memory: MutMap[AdId, Value] = MutMap.empty
      var primaryKey: AdId            = AdId(0)

      override def saveElement(value: Value): AdId = {
        val temp = primaryKey
        primaryKey = primaryKey.inc
        memory(temp) = value
        temp
      }

      override def getElement(key: AdId): Option[Value] = memory.get(key)
