//
//  CourseRunningInfoCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/03.
//

import UIKit

class CourseRunningInfoCVC: UICollectionViewCell {
    
    @IBOutlet var walkingDistanceInfoLabel: UILabel!
    @IBOutlet var walkingDistanceLabel: UILabel!
    @IBOutlet var remainDistanceInfoLabel: UILabel!
    @IBOutlet var remainDistanceLabel: UILabel!
    @IBOutlet var walkingTimeInfoLabel: UILabel!
    @IBOutlet var walkingTimeLabel: UILabel!
    
    @IBOutlet var hotPlaceInfoLabel: UILabel!
    @IBOutlet var hotPlaceCollectionView: UICollectionView!
    
    @IBOutlet var walkingCourseInfoLabel: UILabel!
    @IBOutlet var walkingCourseLabel: UILabel!
    
    @IBOutlet var landmarkInfoLabel: UILabel!
    @IBOutlet var landmarkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        hotPlaceCollectionView.dataSource = self
        hotPlaceCollectionView.delegate = self
        
        hotPlaceCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        settingInfoLabel()
    }
    
    func settingInfoLabel() {
        walkingDistanceInfoLabel.text = "함께 산책한 거리"
        remainDistanceInfoLabel.text = "도착지까지 남은 거리"
        walkingTimeInfoLabel.text = "함께 산책한 시간"
        
        walkingDistanceLabel.text = "0.00"
        remainDistanceLabel.text = "0.00"
        walkingTimeLabel.text = "00:00"
        
        hotPlaceInfoLabel.text = "[성동구 둘레길]의 핫플레이스"
        
        walkingCourseInfoLabel.text = "[성동구 둘레길] 소개"
        walkingCourseLabel.text = "언젠가 먼 길을 떠나고 싶다.\n소년은 동틀 무렵의 엷은 잠에서 눈을 뜨며 문득 이런 생각을 했다.\n파도가 쓸려 가며 자연스러운 무늬를 남기는 것처럼.\n한 번쯤은 아무 목적도 결말도 모르는 길을 무작정 헤매고 싶다고.\n주변은 깊은 물 속처럼 조용하고 서늘한 탓인지 온몸이 작게 떨린다.\n눈을 뜬 소년이 다른 소년들을 조심스럽게 깨우는 동안 안개는 서서히 걷히고 있었다.\n새벽은 여기까지다."
        
        landmarkInfoLabel.text = "[성동구 둘레길]의 랜드마크"
        landmarkButton.setTitle("#서울숲", for: .normal)
    }
}

extension CourseRunningInfoCVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseWalkingInfoHotPlace", for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 170, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
