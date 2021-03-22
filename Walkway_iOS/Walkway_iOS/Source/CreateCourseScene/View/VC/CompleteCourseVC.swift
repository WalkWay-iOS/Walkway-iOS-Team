//
//  CompleteCourseVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/28.
//

import UIKit
import GoogleMaps
import CoreLocation

class CompleteCourseVC: UIViewController {
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var hashInfoLabel: UILabel!
    @IBOutlet weak var distanceTitleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var backgroundInfoLabel: UILabel!
    @IBOutlet weak var timeTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var hashtagLabel: UILabel!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var hashtagTableView: UITableView!
    
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    
    let picker = UIImagePickerController()
    
    var hashtags: [String] = []
    var coordinates: [CLLocationCoordinate2D] = []
    var isMakeCourse = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getDistanceAndTime()
    }
}

// MARK: - TableView
extension CompleteCourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hashtags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HashtagTVC.identifier) as? HashtagTVC else {
            return UITableViewCell()
        }
        cell.setText(text: hashtags[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension CompleteCourseVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 37
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            hashtags.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            confirmTableView()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

// MARK: - Picker
extension CompleteCourseVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            backgroundImageView.image = image
            backgroundImageView.sizeToFit()
        }
        dismiss(animated: true, completion: nil)
    }

    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }

    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        } else {
            print("Camera not available")
        }
    }
}

// MARK: - TextField
extension CompleteCourseVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if (range.length + range.location > currentCharacterCount) {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        
        if textField.text!.count >= 15 && range.length == 0 && range.location < 15 {
            return false
        }
        
        return newLength <= 15
    }
}

// MARK: - UI
extension CompleteCourseVC {
    private func setUI() {
        setPicker()
        setTableView()
        setTableViewNib()
        setView()
        setLabel()
        setButton()
        setTextField()
    }
    
    private func setPicker() {
        picker.delegate = self
    }
    
    private func setTableView() {
        hashtagTableView.delegate = self
        hashtagTableView.dataSource = self
        hashtagTableView.separatorInset.left = 0
        hashtagTableView.separatorColor = .clear
        confirmTableView()
    }
    
    private func setTableViewNib() {
        let nibName = UINib(nibName: "HashtagTVC", bundle: nil)
        hashtagTableView.register(nibName, forCellReuseIdentifier: HashtagTVC.identifier)
    }
    
    private func setView() {
        infoView.backgroundColor = UIColor.bookmarkDarkBlue.withAlphaComponent(0.5)
        emptyView.backgroundColor = .gray30
    }
    
    private func setLabel() {
        titleLabel.text = "나만의 Walkway"
        titleLabel.font = .myBoldSystemFont(ofSize: 20)
        titleLabel.textColor = .bookmarkDarkBlue
        
        infoLabel.text = "나만의 Walkway를 가장 잘 설명하는 이름을 15글자 이하로 표현해주세요."
        infoLabel.font = .myMediumSystemFont(ofSize: 9)
        infoLabel.textColor = .bookmarkGray
        
        distanceTitleLabel.text = "예상 거리"
        distanceTitleLabel.font = .myBoldSystemFont(ofSize: 13)
        distanceTitleLabel.textColor = .gray70
        
        distanceLabel.font = .myBoldSystemFont(ofSize: 20)
        distanceLabel.textColor = .bookmarkDarkBlue
        
        timeTitleLabel.text = "예상 시간"
        timeTitleLabel.font = .myBoldSystemFont(ofSize: 13)
        timeTitleLabel.textColor = .gray70
        
        timeLabel.font = .myBoldSystemFont(ofSize: 20)
        timeLabel.textColor = .bookmarkDarkBlue
        
        hashtagLabel.text = "#해시태그 설정하기"
        hashtagLabel.font = .myMediumSystemFont(ofSize: 18)
        hashtagLabel.textColor = .black
        
        hashInfoLabel.text = "나만의 해시태그는 버튼을 눌러서 추가하고 해시태그를 밀어서 삭제하세요"
        hashInfoLabel.font = .myMediumSystemFont(ofSize: 9)
        hashInfoLabel.textColor = .bookmarkGray
        
        backgroundLabel.text = "#대표사진 설정하기"
        backgroundLabel.font = .myMediumSystemFont(ofSize: 18)
        
        backgroundInfoLabel.text = "대표사진을 설정하지 않으면 Walkway 로고로 사진이 설정됩니다"
        backgroundInfoLabel.font = .myMediumSystemFont(ofSize: 9)
        backgroundInfoLabel.textColor = .bookmarkGray
        
        emptyLabel.text = "해시태그가 존재하지 않아요😢"
        emptyLabel.font = .myMediumSystemFont(ofSize: 13)
        emptyLabel.textColor = .gray70
    }
    
    private func setButton() {
        saveButton.setTitle("다음", for: .normal)
        saveButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        saveButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        saveButton.addTarget(self, action: #selector(touchUpSave), for: .touchUpInside)
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.bookmarkDarkBlue, for: .normal)
        cancelButton.titleLabel?.font = .myBoldSystemFont(ofSize: 15)
        cancelButton.addTarget(self, action: #selector(touchUpCancel), for: .touchUpInside)
        
        addButton.setTitle("", for: .normal)
        addButton.tintColor = .bookmarkDarkBlue
        addButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        addButton.addTarget(self, action: #selector(touchUpAdd), for: .touchUpInside)
        
        addPhotoButton.setTitle("", for: .normal)
        addPhotoButton.tintColor = .bookmarkDarkBlue
        addPhotoButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addPhotoButton.setPreferredSymbolConfiguration(.init(pointSize: 18, weight: .regular, scale: .large), forImageIn: .normal)
        addPhotoButton.addTarget(self, action: #selector(touchUpPhoto), for: .touchUpInside)
        
    }
    
    private func setTextField() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: titleTextField.frame.size.height-3, width: titleTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.bookmarkGray.cgColor
        titleTextField.layer.addSublayer(border)
        titleTextField.setLeftPaddingPoints(10)
        titleTextField.placeholder = "Walkway"
        titleTextField.borderStyle = .none
        titleTextField.delegate = self
    }
    
    private func confirmTableView() {
        if hashtags.isEmpty {
            hashtagTableView.isHidden = true
        } else {
            hashtagTableView.isHidden = false
        }
    }
}

// MARK: - Distance, Time
extension CompleteCourseVC {
    private func getDistanceAndTime() {
        let min = 0.057
        if isMakeCourse {
            var index = 0
            let cnt = coordinates.count - 2
            var totalDistance: CLLocationDistance = 0
            for _ in coordinates[...cnt] {
                let myLocation = CLLocation(latitude: coordinates[index].latitude, longitude: coordinates[index].longitude)
                let myBuddysLocation = CLLocation(latitude: coordinates[index+1].latitude, longitude: coordinates[index+1].longitude)
                let distance = myLocation.distance(from: myBuddysLocation)
                index += 1
                totalDistance += distance
            }
            distanceLabel.text = String(format: "%.02fkm", totalDistance/1000)
            print("거리\(totalDistance)")
            let estimatedTime = (totalDistance / 1000) / min
            if estimatedTime > 59 {
                let hour = Int(estimatedTime / 60)
                let realMin: Int = Int(estimatedTime.truncatingRemainder(dividingBy: min))
                if realMin == 0 {
                    timeLabel.text = "\(hour)시간"
                } else {
                    timeLabel.text = "\(hour)시간 \(realMin)분"
                }
            } else {
                timeLabel.text = "\(Int(estimatedTime))분"
            }
            print("시간\(estimatedTime)")
        } else {
            let myLocation = CLLocation(latitude: coordinates[0].latitude, longitude: coordinates[0].longitude)
            let myBuddysLocation = CLLocation(latitude: coordinates[1].latitude, longitude: coordinates[1].longitude)
            let distance = myLocation.distance(from: myBuddysLocation) / 1000
            distanceLabel.text = String(format: "%.02fkm", distance)
            
            let estimatedTime = distance / min
            if estimatedTime > 59 {
                let hour = Int(estimatedTime / 60)
                let realMin: Int = Int(estimatedTime.truncatingRemainder(dividingBy: min))
                if realMin == 0 {
                    timeLabel.text = "\(hour)시간"
                } else {
                    timeLabel.text = "\(hour)시간 \(realMin)분"
                }
            } else {
                timeLabel.text = "\(Int(estimatedTime))분"
            }
            print("시간\(estimatedTime)")
        }
    }
}

// MARK: - Action
extension CompleteCourseVC {
    @objc func touchUpSave() {
        print("다음")
        // MARK: 넘기기 title, hashtag, distance, hashtag, position, placeName, time
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ReviewVC") as? ReviewVC else {
            return
        }
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func touchUpCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpAdd() {
        print("add")
        if hashtags.count <= 6 {
            guard let dvc = storyboard?.instantiateViewController(identifier: "HashtagPopUpVC") as? HashtagPopUpVC else {
                return
            }
            dvc.saveHashtag = { text in
                self.hashtags.append(text)
                self.confirmTableView()
                self.hashtagTableView.reloadData()
            }
            dvc.modalPresentationStyle = .overCurrentContext
            dvc.modalTransitionStyle = .crossDissolve
            present(dvc, animated: true, completion: nil)
        } else {
            // Alert
        }
    }
    
    @objc func touchUpPhoto() {
        let alert =  UIAlertController(title: "대표사진 설정하기", message: "", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in
            self.openLibrary()
        }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
