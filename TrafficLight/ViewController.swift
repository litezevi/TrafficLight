import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circle1: UIView! // Красный
    @IBOutlet weak var circle2: UIView! // Желтый
    @IBOutlet weak var circle3: UIView! // Зеленый
    
    // Храним текущий статус (0 - Красный, 1 - Желтый, 2 - Зеленый)
    var currentLight: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Инициализируем цвета (только красный активен)
        updateLights()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // Переход по кругу: 0 -> 1 -> 2 -> 0
        currentLight = (currentLight + 1) % 3
        updateLights()
    }
    
    private func updateLights() {
        // Яркие и тусклые версии цветов
        let brightRed = UIColor.red
        let dimRed = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3) // Тусклый красный
        
        let brightYellow = UIColor.yellow
        let dimYellow = UIColor(red: 1, green: 1, blue: 0, alpha: 0.3) // Тусклый желтый
        
        let brightGreen = UIColor.green
        let dimGreen = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3) // Тусклый зеленый
        
        // Включаем один свет, остальные делаем тусклыми
        switch currentLight {
        case 0: // Красный
            circle1.backgroundColor = brightRed
            circle2.backgroundColor = dimYellow
            circle3.backgroundColor = dimGreen
        case 1: // Желтый
            circle1.backgroundColor = dimRed
            circle2.backgroundColor = brightYellow
            circle3.backgroundColor = dimGreen
        case 2: // Зеленый
            circle1.backgroundColor = dimRed
            circle2.backgroundColor = dimYellow
            circle3.backgroundColor = brightGreen
        default:
            break
        }
    }
}
