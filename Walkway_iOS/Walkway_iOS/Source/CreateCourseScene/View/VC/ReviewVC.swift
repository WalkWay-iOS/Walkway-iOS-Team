//
//  ReviewVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/03/22.
//

import UIKit
import CoreLocation
import Moya

class ReviewVC: UIViewController {
    private let authProvider = MoyaProvider<CourseService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var describeLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var startTextField: UITextField!
    
    let desText = "당신의 Walkway에 대해 설명하는 글을 써주세요.\n 최대 800자 입니다."
    
    var titleText: String = ""
    var hashtag: [String]?
    var distance: Double = 0.0
    var position: [CLLocationCoordinate2D]?
    var realPos: [[Double]] = []
    var time: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setKeyboard()
    }
    
    @IBAction func saveData(_ sender: Any) {
        saveReview()
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        setNotification()
    }
    
    @IBAction func cancelData(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ReviewVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        
        if(textView.text == desText) {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
    }
}

extension ReviewVC {
    private func setUI() {
        setButton()
        setLabel()
        setView()
        setTextView()
    }
    
    private func setButton() {
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        saveButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        
        cancelButton.setTitle("뒤로", for: .normal)
        cancelButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        cancelButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
    }
    
    private func setLabel() {
        describeLabel.text = "당신의 Walkway✨"
        describeLabel.textColor = .bookmarkDarkBlue
        describeLabel.font = .myMediumSystemFont(ofSize: 15)
        
        startLabel.text = "출발지"
        startLabel.textColor = .bookmarkDarkBlue
        startLabel.font = .myMediumSystemFont(ofSize: 13)
        
        destinationLabel.text = "도착지"
        destinationLabel.textColor = .bookmarkDarkBlue
        destinationLabel.font = .myMediumSystemFont(ofSize: 13)
    }
    
    private func setView() {
        backView.layer.cornerRadius = 20
    }
    
    private func setTextView() {
        textView.font = .myRegularSystemFont(ofSize: 13)
        textView.delegate = self
        textView.text = desText
        textView.backgroundColor = .clear
    }
    
    func setData(title: String, hashtag: [String], distance: Double, position: [CLLocationCoordinate2D], time: String) {
        titleText = title
        self.hashtag = hashtag
        self.distance = distance
        self.position = position
        self.time = time
        
        var index = 0
        
        for mapData in position {
            let lat = mapData.latitude
            let long = mapData.longitude
            let arr = [lat, long]
            realPos.append(arr)
            index += 1
        }
    }
}

//MARK: Keyboard
extension ReviewVC {
    private func setKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissGestureKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissGestureKeyboard() {
        view.endEditing(true)
    }
}

// MARK: Notification
extension ReviewVC {
    private func setNotification() {
        NotificationCenter.default.post(name: NSNotification.Name("Save"), object: nil)
    }
}

// MARK: Network
extension ReviewVC {
    func saveReview() {
        let disNum = round(distance * 10) / 10
        let positionName = ["\(startTextField.text!)", "\(destinationTextField.text!)"]
        let param = ReviewRequest.init(titleText, disNum, time ?? "0시간", textView.text!, realPos, positionName, hashtag: hashtag ?? [])
        print(param)
        authProvider.request(.create(param: param)) { response in
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
