//
//  FollowerKeywordTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerKeywordTVC: UITableViewCell {
    static let identifier = "FollowerKeywordTVC"
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var keywordCollectionView: UICollectionView!
    
    var keywords: [String] = ["남산", "서울대공원", "밤", "밤산책", "신나요"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionViewDelegate
extension FollowerKeywordTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerKeywordCVC.identifier, for: indexPath) as? FollowerKeywordCVC else {
            return UICollectionViewCell()
        }
        cell.setLabelText(text: keywords[indexPath.row])
        return cell
    }
}

extension FollowerKeywordTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 78, height: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 18, right: 16)
    }
}

// MARK: - UI
extension FollowerKeywordTVC {
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
        keywordCollectionView.delegate = self
        keywordCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName =  UINib(nibName: "FollowerKeywordCVC", bundle: nil)
        keywordCollectionView.register(nibName, forCellWithReuseIdentifier: FollowerKeywordCVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.font = .myBoldSystemFont(ofSize: 16)
    }
}

// MARK: - Data
extension FollowerKeywordTVC {
    func setName(name: String) {
        titleLabel.text = "\(name) 님의 대표키워드"
    }
}
