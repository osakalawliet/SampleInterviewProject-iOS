//
//  FavoriteFriendCell.swift
//  SampleInterviewProject-iOS
//
//  Created by Joy Marie Navales on 9/26/20.
//  Copyright © 2020 Joy Marie Navales. All rights reserved.
//

import UIKit

class FavoriteFriendCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
}

extension FavoriteFriendCell {
    
    func setupFavoriteFriend(_ friend: Friend){
        if let avatarUrl = friend.avatarUrl {
            let url = URL.init(string: avatarUrl)
            avatarImageView.kf.setImage(with: url) {
                    result in
                    switch result {
                    case .success( _):
                        _ = self.avatarImageView.sample
                            .makeRounded(borderWidth: Constants.AVATAR_BORDER_WIDTH, bordercolor: UIColor.sample.yellow.cgColor)
                    case .failure(let error):
                        print("Job failed: \(error.localizedDescription)")
                    }
                }
        }
        if let givenName = friend.givenName,
            let surname = friend.surname {
            nameLabel.text = "\(givenName) \(surname)"
        }
    }
}

// MARK: - ReusableDequeueable

extension FavoriteFriendCell: ReusableDequeueable {
    static let identifier = "FavoriteFriendCell"
}

