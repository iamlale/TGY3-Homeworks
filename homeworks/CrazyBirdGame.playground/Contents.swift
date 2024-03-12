import UIKit
import Foundation

class Player {
    var nickname: String
    var score: Int
    
    init(nickname: String, score: Int = 0) {
        self.nickname = nickname
        self.score = score
    }
    
    func displayInfo() {
        print("\(nickname)'s current score: \(score)")
    }
    
    func updateScore(points: Int) {
        score += points
    }
}

class Bottle {
    var position: Double
    var coverageDistance: Double
    var isUpright: Bool
    
    init(position: Double, coverageDistance: Double, isUpright: Bool = true) {
        self.position = position
        self.coverageDistance = max(0.1, min(coverageDistance, 1.0))
        self.isUpright = isUpright
    }
    
    func evaluateShot(range: Double) -> Bool {
        if position - coverageDistance <= range && range <= position + coverageDistance {
            isUpright = false
            return true // the bottle was hit
        }
        return false // the bottle was not hit
    }
}

class BallThrowingDevice {
    let gravity: Double = 10.0
    
    func calculateRange(velocity: Double, angle: Double) -> Double? {
        if velocity < 0 || velocity > 100 || angle < 0 || angle > 90 {
            print("Invalid inputs. Make sure 0 <= velocity <= 100 m/s and 0 <= angle <= 90 degrees.")
            return nil
        }
        let angleInRadians = angle * .pi / 180
        return (velocity * velocity * sin(2 * angleInRadians)) / gravity
    }
    
    func performShot(velocity: Double, angle: Double, bottle: Bottle, player: Player) {
        guard let range = calculateRange(velocity: velocity, angle: angle) else {
            return
        }
        
        if bottle.evaluateShot(range: range) {
            print("Hit! The bottle was knocked down.")
            player.updateScore(points: 1) // each hit increases the player's score by 1
        } else {
            print("Miss! The bottle remains upright.")
        }
        player.displayInfo()
    }
}
class Game {
    var player: Player
    var device: BallThrowingDevice
    var bottle: Bottle?
    
    init(playerNickname: String) {
        self.player = Player(nickname: playerNickname)
        self.device = BallThrowingDevice()
    }
    
    func setBottlePosition(position: Double, coverageDistance: Double) {
        self.bottle = Bottle(position: position, coverageDistance: coverageDistance)
    }
    
    func enterLaunchParameters(velocity: Double, angle: Double) -> (Double, Double) {
        return (velocity, angle)
    }
    
    func throwBall(velocity: Double, angle: Double) {
        guard let bottle = self.bottle else {
            print("The bottle has not been set up. Please set the bottle position first.")
            return
        }
        
        device.performShot(velocity: velocity, angle: angle, bottle: bottle, player: player)
        if !bottle.isUpright {
            print("\(player.nickname) scored a point!")
        } else {
            print("\(player.nickname) missed the bottle.")
        }
    }
}

let game = Game(playerNickname: "SharpShooter")
game.setBottlePosition(position: 100.0, coverageDistance: 0.5)
let launchParameters = game.enterLaunchParameters(velocity: 30.0, angle: 45.0)
game.throwBall(velocity: launchParameters.0, angle: launchParameters.1)
