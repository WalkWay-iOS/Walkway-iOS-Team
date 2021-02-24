//
//  CourseWalkingInfoCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

var hotplaceName = ["서울숲", "성수동", "안녕길", "카페거리", "아이스크림"]

class CourseWalkingInfoCVC: UICollectionViewCell {
    static let identifier = "CourseWalkingInfoCVC"
    
    @IBOutlet var hotPlaceInfoTitleLabel: UILabel!
    @IBOutlet var hotPlaceCollectionView: UICollectionView!
    
    @IBOutlet var walkingCourseInfoTitleLabel: UILabel!
    @IBOutlet var walkingCourseInfoLabel: UILabel!
    
    @IBOutlet var landmarkInfoLabel: UILabel!
    @IBOutlet var landmarkKeywordButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - CollectionViewDelegate
extension CourseWalkingInfoCVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotplaceName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseWalkingHotPlaceCVC.identifier, for: indexPath) as? CourseWalkingHotPlaceCVC else {
            return UICollectionViewCell()
        }
        cell.setData(hotplace: hotplaceName[indexPath.row])
        return cell
    }
}

extension CourseWalkingInfoCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
}

// MARK: - UI
extension CourseWalkingInfoCVC {
    func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setButton()
    }
    
    func setCollectionView() {
        hotPlaceCollectionView.dataSource = self
        hotPlaceCollectionView.delegate = self
    }
    
    func setCollectionViewNib() {
        let nibName = UINib(nibName: "CourseWalkingHotPlaceCVC", bundle: nil)
        hotPlaceCollectionView.register(nibName, forCellWithReuseIdentifier: CourseWalkingHotPlaceCVC.identifier)
    }
    
    func setLabel() {
        hotPlaceInfoTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        hotPlaceInfoTitleLabel.textColor = .systemIndigo
        hotPlaceInfoTitleLabel.text = "[성동구 둘레길]의 핫플레이스"
        
        walkingCourseInfoTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        walkingCourseInfoTitleLabel.textColor = .systemIndigo
        walkingCourseInfoTitleLabel.text = "[성동구 둘레길] 소개"
        walkingCourseInfoLabel.font = .systemFont(ofSize: 10, weight: .bold)
        walkingCourseInfoLabel.textColor = .black
        walkingCourseInfoLabel.text = "언젠가 먼 길을 떠나고 싶다.\n소년은 동틀 무렵의 엷은 잠에서 눈을 뜨며 문득 이런 생각을 했다.\n파도가 쓸려 가며 자연스러운 무늬를 남기는 것처럼.\n한 번쯤은 아무 목적도 결말도 모르는 길을 무작정 헤매고 싶다고.\n주변은 깊은 물 속처럼 조용하고 서늘한 탓인지 온몸이 작게 떨린다.\n눈을 뜬 소년이 다른 소년들을 조심스럽게 깨우는 동안 안개는 서서히 걷히고 있었다.\n새벽은 여기까지다.\nSo good\n그래요 너무 좋아요."
        
        landmarkInfoLabel.font = .systemFont(ofSize: 10, weight: .bold)
        landmarkInfoLabel.textColor = .systemIndigo
        landmarkInfoLabel.text = "[성동구 둘레길]의 랜드마크"
    }
    
    func setButton() {
        landmarkKeywordButton.setTitle("#서울숲", for: .normal)
        landmarkKeywordButton.setTitleColor(.white, for: .normal)
        landmarkKeywordButton.backgroundColor = .systemIndigo
        landmarkKeywordButton.layer.cornerRadius = 5
    }
}
