
import cats.effect.IO

trait AdServer:
  def start: IO[Unit]

object AdServer:
  def create(): AdServer =
    val database = Database.create[Ad]()
    val console  = Console()
    new AdServer:   
      private val addAd: IO[Unit] =
        console.writeValue("Enter ad data: ") *>
          console.readValue.map(adFromString).flatMap {
            case ad: Ad =>
              database.saveElement(ad).flatMap(insertedId => console.writeValue(s"Inserted ad with id: $insertedId"))
            case err: AdParseError =>
              console.writeValue(err.message)
          }

      private val readAd: IO[Unit] =
        console.writeValue("Enter adId: ") *>
          console.readValue
            .map(n => AdId(n.toLong))
            .flatMap(database.getElement)
            .flatMap {
              case Some(ad) => console.writeValue(ad.consoleString)
              case None     => console.writeValue("Could not find ad!")
            }
        
      val start: IO[Unit] = 
        console.writeValue("Select mode: quit, add, read: ") *>
          console.readValue.map(modeFromStrnig).flatMap {
            case Right(Mode.ADD) => addAd *> start
            case Right(Mode.READ) => readAd *> start
            case Right(Mode.EXIT) => console.writeValue("Goodbye")
            case Left(err) => console.writeValue(s"unknown mode $err") *> start
          }
          
        
