//
//  FollowerCourseTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerCourseTVC: UITableViewCell {
    static let identifier = "FollowerCourseTVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var courseCollectionView: UICollectionView!
    @IBOutlet weak var bottomView: UIView!
    
    var courses: [String] = ["남산 한바퀴", "남산 두바퀴", "룰루리랄라리 신나는북악산여행", "북악산가자", "집뒤에 숨어있는 보물"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionViewDelegate
extension FollowerCourseTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCourseCVC.identifier, for: indexPath) as? FollowerCourseCVC else {
            return UICollectionViewCell()
        }
        cell.setTitle(title: courses[indexPath.row])
        return cell
    }
}

extension FollowerCourseTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 83)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}

// MARK: - UI
extension FollowerCourseTVC {
    private func setUI() {
        setView()
        setCollectionView()
        setCollectionViewNib()
        setLabel()
    }
    
    private func setView() {
        bottomView.backgroundColor = .gray40
    }
    
    private func setCollectionView() {
        courseCollectionView.delegate = self
        courseCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName =  UINib(nibName: "FollowerCourseCVC", bundle: nil)
        courseCollectionView.register(nibName, forCellWithReuseIdentifier: FollowerCourseCVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "따릉이 님의 코스"
        titleLabel.font = .boldSystemFont(ofSize: 16)
    }
}
