//
//  DetailPhotoTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/26.
//

import UIKit

class DetailPhotoTVC: UITableViewCell {
    static let identifier = "DetailPhotoTVC"

    @IBOutlet weak var noDataView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var delegate: detailDelegate?
    
    var photos: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionViewDelegate
extension DetailPhotoTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photos.count < 6 {
            return photos.count
        }
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCVC.identifier, for: indexPath) as? PhotoCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension DetailPhotoTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 4)/3
        let height = (collectionView.frame.size.height - 2)/2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - UI
extension DetailPhotoTVC {
    private func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setView()
        setLabel()
        setButton()
    }
    
    private func setCollectionView() {
        if photos.count == 0 {
            photoCollectionView.isHidden = true
        } else {
            photoCollectionView.isHidden = false
        }
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName = UINib(nibName: "PhotoCVC", bundle: nil)
        photoCollectionView.register(nibName, forCellWithReuseIdentifier: PhotoCVC.identifier)
    }
    
    private func setView() {
        noDataView.backgroundColor = .gray20
        let noDataLabel = UILabel()
        
        if photos.count == 0 {
            noDataLabel.isHidden = false
            noDataLabel.text = "코스 후기 사진이 없어요🙅🏻‍♀️"
            noDataLabel.font = .systemFont(ofSize: 13, weight: .semibold)
            noDataLabel.textColor = .gray50
            noDataLabel.translatesAutoresizingMaskIntoConstraints = false
            
            noDataView.addSubview(noDataLabel)
            noDataLabel.centerXAnchor.constraint(equalTo: noDataView.centerXAnchor).isActive = true
            noDataLabel.centerYAnchor.constraint(equalTo: noDataView.centerYAnchor).isActive = true
        } else {
            noDataLabel.isHidden = true
        }
    }
    
    private func setLabel() {
        if photos.count > 99 {
            titleLabel.text = "코스 후기 사진(99+)"
        } else {
            titleLabel.text = "코스 후기 사진(\(photos.count))"
        }
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    private func setButton() {
        viewAllButton.setTitle("전체보기", for: .normal)
        viewAllButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        viewAllButton.setTitleColor(.gray70, for: .normal)
        viewAllButton.addTarget(self, action: #selector(touchUpViewAll), for: .touchUpInside)
    }
}

// MARK: - Action
extension DetailPhotoTVC {
    @objc func touchUpViewAll() {
        guard let dvc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "DetailPhotoVC") as? DetailPhotoVC else {
            return
        }
        delegate?.cellTapedPhoto(dvc: dvc)
    }
}
