//
//  MyCourseTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit

class MyCourseTVC: UITableViewCell {
    static let identifier = "MyCourseTVC"
    
    @IBOutlet var myCourseTitleLabel: UILabel!
    @IBOutlet var courseAllButton: UIButton!
    @IBOutlet var myCourseCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionViewDelegate
extension MyCourseTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MycourseListCVC.identifier, for: indexPath) as? MycourseListCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension MyCourseTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}

// MARK: - UI
extension MyCourseTVC {
    private func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setButton()
    }
    
    private func setCollectionView() {
        myCourseCollectionView.delegate = self
        myCourseCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName = UINib(nibName: "MycourseListCVC", bundle: nil)
        myCourseCollectionView.register(nibName, forCellWithReuseIdentifier: MycourseListCVC.identifier)
    }
    
    private func setLabel() {
        myCourseTitleLabel.text = "나의 코스"
    }
    
    private func setButton() {
        courseAllButton.tintColor = .black
        courseAllButton.setTitle("전체보기", for: .normal)
    }
}
