//
//  ViewController.swift
//  LottoApp
//
//  Created by 심소영 on 6/7/24.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    struct Lotto: Decodable {
        let drwNoDate: String
        let drwNo,drwtNo1,drwtNo2,drwtNo3,drwtNo4,drwtNo5,drwtNo6,bnusNo: Int
    }
    
    var maxRound = Array(1...1122)
    
    let numberTextField = UITextField()
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let roundLabel = UILabel()
    let resultLabel = UILabel()
    
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let thirdLabel = UILabel()
    let fourthLable = UILabel()
    let fifthLable = UILabel()
    let sixthLable = UILabel()
    let plusLable = UILabel()
    let extraLable = UILabel()
    let extraTextLable = UILabel()
    
    let datePicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureDatePicker()
    }

    func configureDatePicker(){
        datePicker.delegate = self
        datePicker.dataSource = self
        datePicker.selectRow(maxRound.count, inComponent: 0, animated: true)
    }
    
    func configureHierarchy(){
        view.addSubview(numberTextField)
        view.addSubview(nameLabel)
        view.addSubview(dateLabel)
        view.addSubview(resultLabel)
        view.addSubview(roundLabel)
        
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        view.addSubview(fourthLable)
        view.addSubview(fifthLable)
        view.addSubview(sixthLable)
        view.addSubview(plusLable)
        view.addSubview(extraLable)
        view.addSubview(extraTextLable)
        view.addSubview(datePicker)
    }
    func configureLayout(){
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(50)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(20)
            make.leading.equalTo(30)
            make.height.equalTo(30)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(20)
            make.trailing.equalTo(-30)
            make.height.equalTo(30)
        }
        roundLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
            make.leading.equalTo(140)
            make.height.equalTo(30)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
            make.leading.equalTo(roundLabel.snp.trailing).offset(5)
            make.height.equalTo(30)
        }
        firstLabel.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.leading.equalTo(nameLabel.snp.leading)
            make.size.equalTo(40)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.leading.equalTo(firstLabel.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        thirdLabel.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.leading.equalTo(secondLabel.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        fourthLable.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.leading.equalTo(thirdLabel.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        fifthLable.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.leading.equalTo(fourthLable.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        sixthLable.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.leading.equalTo(fifthLable.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        plusLable.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(30)
            make.leading.equalTo(sixthLable.snp.trailing).offset(5)
            make.size.equalTo(20)
        }
        extraLable.snp.makeConstraints { make in
            make.top.equalTo(roundLabel.snp.bottom).offset(20)
            make.leading.equalTo(plusLable.snp.trailing).offset(5)
            make.size.equalTo(40)
        }
        extraTextLable.snp.makeConstraints { make in
            make.top.equalTo(extraLable.snp.bottom).offset(5)
            make.leading.equalTo(plusLable.snp.trailing).offset(10)
            make.height.equalTo(15)
        }
        datePicker.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }

        
    }
    func configureUI(){
        view.backgroundColor = .white
        numberTextField.layer.borderColor = UIColor.lightGray.cgColor
        numberTextField.layer.borderWidth = 1
        nameLabel.textColor = .black
        nameLabel.text = "당첨번호 안내"
        nameLabel.font = .systemFont(ofSize: 14, weight: .heavy)
        dateLabel.textColor = .lightGray
        dateLabel.font = .systemFont(ofSize: 12, weight: .bold)
        resultLabel.text = "당첨결과"
        resultLabel.textColor = .black
        resultLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        roundLabel.textColor = .systemYellow
        roundLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        plusLable.text = "+"
        plusLable.font = .boldSystemFont(ofSize: 20)
        plusLable.textColor = .black
        plusLable.textAlignment = .center
        firstLabel.settingLabel(color: .systemYellow)
        extraTextLable.textAlignment = .center
        extraTextLable.text = "보너스"
        extraTextLable.font = .systemFont(ofSize: 12, weight: .heavy)
        extraTextLable.textColor = .lightGray
        secondLabel.settingLabel(color: .systemBlue)
        thirdLabel.settingLabel(color: .systemBlue)
        fourthLable.settingLabel(color: .systemRed)
        fifthLable.settingLabel(color: .systemRed)
        sixthLable.settingLabel(color: .lightGray)
        extraLable.settingLabel(color: .lightGray)
    }
}

extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxRound.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberTextField.text = "\(maxRound[row])"
        let url = "\(URL.lottoURL)\(numberTextField.text!)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                self.firstLabel.text = "\(value.drwtNo1)"
                self.secondLabel.text = "\(value.drwtNo2)"
                self.thirdLabel.text = "\(value.drwtNo3)"
                self.fourthLable.text = "\(value.drwtNo4)"
                self.fifthLable.text = "\(value.drwtNo5)"
                self.sixthLable.text = "\(value.drwtNo6)"
                self.extraLable.text = "\(value.bnusNo)"
                self.roundLabel.text = "\(value.drwNo)회"
                self.dateLabel.text = "\(value.drwNoDate) 추첨"
            case .failure(_):
                self.numberTextField.placeholder = "회차를 선택하세요."
            }
        }
    }
}
