//
//  ViewController.swift
//  TwilightRoundCounter
//
//  Created by Сергей Денисенко on 30.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    @IBOutlet var settingsButton: UIButton!
    @IBOutlet var roundLabel: UILabel!

    @IBOutlet var USSAView: UIView!
    @IBOutlet var USAView: UIView!

    private var currentRound = 1
    private var currentAction = 1
    private var isFirstAction = true

    private var trailingUSAConstraint = NSLayoutConstraint()
    private var leadingUSSAConstraint = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        roundLabel.text = "Для запуска игры нажми кнопку Start"
    }

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
    }

    private func startMiddleGame() {

        let alert = UIAlertController(title: "Середина войны",
                                      message: "В начале 4го хода в колоду замешиваются и раздаются карты середины войны\nОтбой в колоду не замешивается\nИгроки получают по 9 карт\nХод длится 7 раундов",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Готово", style: .default, handler: nil)
        alert.addAction(action)

        DispatchQueue.main.async { () -> Void in
            self.present(alert, animated: true, completion: nil)
        }
    }

    private func startEndGame() {

        let alert = UIAlertController(title: "Окончание войны",
                                      message: "В начале 8го хода в колоду замешиваются и раздаются карты Окончания войны\nОтбой в колоду не замешивается\nИгроки получают по 9 карт\nХод длится 7 раундов",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Готово", style: .default, handler: nil)
        alert.addAction(action)

        DispatchQueue.main.async { () -> Void in
            self.present(alert, animated: true, completion: nil)
        }
    }

    private func startNewAction() {
        let alert = UIAlertController(title: "Новый ход: \(currentAction)",
                                      message: "Обновите руку и сыграйте фазу заголовков",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default, handler: nil)
        alert.addAction(action)

        DispatchQueue.main.async { () -> Void in
            self.present(alert, animated: true, completion: nil)
        }
    }

    private func setupView() {
        trailingUSAConstraint = USAView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
        leadingUSSAConstraint = USSAView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)

        trailingUSAConstraint.priority = UILayoutPriority(910)
        leadingUSSAConstraint.priority = UILayoutPriority(910)

        NSLayoutConstraint.activate([trailingUSAConstraint, leadingUSSAConstraint])
        view.layoutIfNeeded()

        roundLabel.text = "Ход: \(currentAction) Раунд: \(currentRound)"
    }

    @IBAction func startButtonClicked(_ sender: Any) {
        startButton.isHidden = true

        let alert = UIAlertController(title: "Начало войны",
                                      message: "Раздайте каждому игроку по 8 карт.\nПоложите Карту Китая.\nПоместите дополнительное влияние\n СССР:\n6 единиц в Восточной Европе,\nСША: 7 единиц в Западной Европе\nХод длится 6 раундов",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Готово", style: .default, handler: {_ in
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.setupView()
            }
        })
        alert.addAction(action)

        DispatchQueue.main.async { () -> Void in
            self.present(alert, animated: true, completion: nil)
        }

        setupGestures()
    }

    private func USSAAction() {
        trailingUSAConstraint = USAView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
        leadingUSSAConstraint = USSAView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)

        trailingUSAConstraint.priority = UILayoutPriority(920)
        leadingUSSAConstraint.priority = UILayoutPriority(930)

        UIView.animate(withDuration: 0.5, delay: 0.0) {
            NSLayoutConstraint.activate([self.trailingUSAConstraint, self.leadingUSSAConstraint])
            self.view.layoutIfNeeded()
        }
    }

    private func USAAction() {
        trailingUSAConstraint = USAView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        leadingUSSAConstraint = USSAView.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)

        trailingUSAConstraint.priority = UILayoutPriority(920)
        leadingUSSAConstraint.priority = UILayoutPriority(930)

        UIView.animate(withDuration: 0.5, delay: 0.0) {
            NSLayoutConstraint.activate([self.trailingUSAConstraint, self.leadingUSSAConstraint])
            self.view.layoutIfNeeded()
        }
    }

    private func switchAction() {
        switch currentAction {
        case 1...3:
            if currentRound < 6 {
                if isFirstAction {
                    isFirstAction.toggle()
                    USAAction()
                } else {
                    isFirstAction.toggle()
                    currentRound += 1
                    roundLabel.text = "Ход: \(currentAction) Раунд: \(currentRound)"
                    USSAAction()
                }
            } else {
                if isFirstAction {
                    isFirstAction.toggle()
                    USAAction()
                } else if currentAction == 3 {
                    isFirstAction.toggle()
                    currentRound = 1
                    currentAction += 1
                    roundLabel.text = "Ход: \(currentAction) Раунд: \(currentRound)"
                    USSAAction()
                    startMiddleGame()
                } else {
                    isFirstAction.toggle()
                    currentRound = 1
                    currentAction += 1
                    roundLabel.text = "Ход: \(currentAction) Раунд: \(currentRound)"
                    USSAAction()
                    startNewAction()
                }
            }
        case 4...7:
            if currentRound < 7 {
                if isFirstAction {
                    isFirstAction.toggle()
                    USAAction()

                } else {
                    isFirstAction.toggle()
                    currentRound += 1
                    roundLabel.text = "Ход: \(currentAction) Раунд: \(currentRound)"
                    USSAAction()
                }
            } else {
                if isFirstAction {
                    isFirstAction.toggle()
                    USAAction()
                } else if currentAction == 7 {
                    isFirstAction.toggle()
                    currentRound = 1
                    currentAction += 1
                    roundLabel.text = "Ход: \(currentAction) Раунд: \(currentRound)"
                    USSAAction()
                    startEndGame()
                } else {
                    isFirstAction.toggle()
                    currentRound = 1
                    currentAction += 1
                    roundLabel.text = "Ход: \(currentAction) Раунд: \(currentRound)"
                    USSAAction()
                    startNewAction()
                }
            }

        case 10:
            if currentRound < 7 {
                if isFirstAction {
                    isFirstAction.toggle()
                    USAAction()

                } else {
                    isFirstAction.toggle()
                    currentRound += 1
                    roundLabel.text = "Ход: \(currentAction) Раунд: \(currentRound)"
                    USSAAction()
                }
            } else {
                if isFirstAction {
                    isFirstAction.toggle()
                    USSAAction()
                } else {
                    let alert = UIAlertController(title: "Конец Игры",
                                                  message: "Выполните финальный подсчет очков",
                                                  preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ок", style: .default, handler: nil)
                    alert.addAction(action)

                    DispatchQueue.main.async { () -> Void in
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        default:
            break
        }
    }

    @IBAction func settingButtonTap(_ sender: Any) {
        trailingUSAConstraint = USAView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        leadingUSSAConstraint = USSAView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)

        trailingUSAConstraint.priority = UILayoutPriority(900)
        leadingUSSAConstraint.priority = UILayoutPriority(900)

        NSLayoutConstraint.activate([trailingUSAConstraint, leadingUSSAConstraint])
        view.layoutIfNeeded()

        currentAction = 1
        currentRound = 1

        roundLabel.text = "Для запуска игры нажми кнопку Start"
        startButton.isHidden = false
    }

    @objc private func tapAction() {
        switchAction()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    private var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.bounds.width - sideInset * 3) / 2
        return CGSize(width: width, height: width)

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        cell.backgroundColor = .cyan
        return cell
    }


}

