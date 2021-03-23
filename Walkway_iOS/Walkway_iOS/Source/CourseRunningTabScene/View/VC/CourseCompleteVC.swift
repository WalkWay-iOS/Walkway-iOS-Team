//
//  CourseCompleteVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit
import Moya

class CourseCompleteVC: UIViewController {
    private let authProvider = MoyaProvider<CourseService>(plugins: [NetworkLoggerPlugin(verbose: true)])

    @IBOutlet var saveButton: UIButton!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var courseRecordTableView: UITableView!
    
    var delegate: walkingCourseMemoPresentDelegate?
    var courseId: String?
    
    var time: String = ""
    var distance: Double = 0.0
    var strength: Double = 0.0
    var rate: Double = 0.0
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - TableViewDelegate
extension CourseCompleteVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseRecordInfoTVC.identifier) as? CourseRecordInfoTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseEstimateTVC.identifier) as? CourseEstimateTVC else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        
        else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseMemoTVC.identifier) as? CourseMemoTVC else {
                return UITableViewCell()
            }
            cell.tableView = courseRecordTableView
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension CourseCompleteVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 140
        }
        else if indexPath.section == 1 {
            return 170
        }
        else if indexPath.section == 2 {
            return 250
        }
        return 0
    }
}

// MARK: - UI
extension CourseCompleteVC {
    func setUI() {
        setTableView()
        setTableViewNib()
        setLabel()
        setButton()
    }
    
    func setTableView() {
        courseRecordTableView.delegate = self
        courseRecordTableView.dataSource = self
        courseRecordTableView.separatorColor = .clear
    }
    
    func setTableViewNib() {
        let infoNib = UINib(nibName: "CourseRecordInfoTVC", bundle: nil)
        courseRecordTableView.register(infoNib, forCellReuseIdentifier: CourseRecordInfoTVC.identifier)
        
        let estimateNib = UINib(nibName: "CourseEstimateTVC", bundle: nil)
        courseRecordTableView.register(estimateNib, forCellReuseIdentifier: CourseEstimateTVC.identifier)
        
        let memoNib = UINib(nibName: "CourseMemoTVC", bundle: nil)
        courseRecordTableView.register(memoNib, forCellReuseIdentifier: CourseMemoTVC.identifier)
    }
    
    func setLabel() {
        userNameLabel.font = .myBoldSystemFont(ofSize: 13)
        userNameLabel.textColor = .bookmarkDarkBlue
        userNameLabel.text = "🌈 Walkway와 함께한 기록입니다"
    }
    
    func setButton() {
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        saveButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        saveButton.addTarget(self, action: #selector(touchUpSave), for: .touchUpInside)
    }
    
    @objc func touchUpSave() {
        print("저장하자")
        let alert = UIAlertController(title: "기록을 저장하시겠어요?", message: "해당 ✨Walkway✨를 당신의 기록에 저장해둘게요.", preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "아니오", style: .cancel) { (Action) in
            
        }
        let okAction = UIAlertAction(title: "네", style: .default) { (Action) in
            self.sendRecord()
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func setNotification() {
        NotificationCenter.default.post(name: NSNotification.Name("recordSave"), object: nil)
    }
}

// MARK: - Protocol
extension CourseCompleteVC: walkingCourseMemoPresentDelegate {
    func buttonTappedMemo(dvc: CourseMemoVC) {
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: Network
extension CourseCompleteVC {
    func sendRecord() {
        setNotification()
        let userDefault = UserDefaults.standard
        
        if let time = userDefault.string(forKey: "time") {
            let times = time.split(separator: ":")
            var timeString = ""
            if times[0] == "00" {
                let min = Int(times[1])
                print(min)
                timeString = "\(min ?? 1)분"
            } else {
                let hour = Int(times[0])
                let min = Int(times[1])
                timeString = "\(hour ?? 1)시간 \(min ?? 1)분"
            }
            self.time = timeString
        }
        
        if let distances = userDefault.object(forKey: "distance") {
            let num = distances as! Double
            self.distance = num
        }
        
        if let strength = userDefault.object(forKey: "strength") {
            let str = strength as! Double
            self.strength = str
        }
        
        if let getrate = userDefault.object(forKey: "rate") {
            let rates = getrate as! Double
            rate = rates
        }
        
        if let review = userDefault.string(forKey: "content") {
            content = review
        }
        
        let param = RecordRequest.init(distance, time, content, rate, strength)
        print(param)
        authProvider.request(.record(ID: self.courseId ?? "", param: param)) { response in
            switch response {
            case .success(let result):
                do {
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
