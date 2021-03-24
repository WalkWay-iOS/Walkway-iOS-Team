//
//  CourseWalkingInfoCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CourseWalkingInfoCVC: UICollectionViewCell {
    static let identifier = "CourseWalkingInfoCVC"
    
    @IBOutlet weak var landMarkCollectionView: UICollectionView!
    @IBOutlet var walkingCourseInfoTitleLabel: UILabel!
    @IBOutlet var walkingCourseInfoLabel: UILabel!
    
    @IBOutlet var landmarkInfoLabel: UILabel!
    
    var isHashtaged = false
    
    var landMark: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

extension CourseWalkingInfoCVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return landMark.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseWalkingHotPlaceCVC.identifier, for: indexPath) as? CourseWalkingHotPlaceCVC else {
            return UICollectionViewCell()
        }
        cell.setData(hotplace: landMark[indexPath.item])
        return cell
    }
}

extension CourseWalkingInfoCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: 25))
        label.text = landMark[indexPath.item]
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.contentMode = .scaleToFill
        label.font = .myBoldSystemFont(ofSize: 13)
        label.sizeToFit()
        
        let calculateWidth = label.intrinsicContentSize.width + 26
        return CGSize(width: calculateWidth, height: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
}

// MARK: - UI
extension CourseWalkingInfoCVC {
    func setUI() {
        setLabel()
    }
    
    func setCollectionView() {
        landMarkCollectionView.delegate = self
        landMarkCollectionView.dataSource = self
        
        let nib = UINib(nibName: "CourseWalkingHotPlaceCVC", bundle: nil)
        landMarkCollectionView.register(nib, forCellWithReuseIdentifier: CourseWalkingHotPlaceCVC.identifier)
    }
    
    func setLabel() {
        walkingCourseInfoTitleLabel.font = .myBoldSystemFont(ofSize: 15)
        walkingCourseInfoTitleLabel.textColor = .bookmarkDarkBlue
        
        walkingCourseInfoLabel.font = .myRegularSystemFont(ofSize: 12)
        
        landmarkInfoLabel.font = .myBoldSystemFont(ofSize: 15)
        landmarkInfoLabel.textColor = .bookmarkDarkBlue
    }
    
    func setData(title: String, content: String, hashtags: [String]) {
        walkingCourseInfoTitleLabel.text = "[\(title)] 소개"
        walkingCourseInfoLabel.text = content
        landmarkInfoLabel.text = "[\(title)]의 랜드마크"
        
        landMark = hashtags
        setCollectionView()
    }
}
