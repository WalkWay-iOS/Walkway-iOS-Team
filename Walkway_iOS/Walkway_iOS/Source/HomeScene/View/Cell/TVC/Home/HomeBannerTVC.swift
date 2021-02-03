//
//  HomeBannerTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class HomeBannerTVC: UITableViewCell {
    static let identifier = "HomeBannerTVC"
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    var delegate: cellPresentDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionViewDelegate
extension HomeBannerTVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCVC.identifier, for: indexPath) as? HomeBannerCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension HomeBannerTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension HomeBannerTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 || indexPath.section == 1 {
            guard let dvc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "BannerVC") as? BannerVC else {
                return
            }
            
            if indexPath.section == 0 {
                dvc.isSeoul = true
            } else {
                dvc.isSeoul = false
            }
            
            delegate?.collectionViewCellTapedBanner(dvc: dvc)
        }
    }
}
 
// MARK: - UI
extension HomeBannerTVC {
    private func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setPageControl()
    }
    
    private func setCollectionView() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName = UINib(nibName: "HomeBannerCVC", bundle: nil)
        bannerCollectionView.register(nibName, forCellWithReuseIdentifier: HomeBannerCVC.identifier)
    }
    
    private func setPageControl() {
        pageController.numberOfPages = 3
        pageController.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    }
}

// MARK: - Page Control
extension HomeBannerTVC {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
