//
//  ArticleCell.swift
//  Splash
//
//  Created by Букшев Иван Евгеньевич on 10.04.18.
//  Copyright © 2018 ivanglushko. All rights reserved.
//

import UIKit
import ChameleonFramework

class ArticleCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    private let defaultLinesNumber = 4

    func configure(with article: Article?) {
        guard let article = article else { return }
        titleLabel.text = article.title
        dateLabel.text = article.pubDate.dateString() + " at " + article.pubDate.timeString()
        descriptionLabel.text = article.descriptionString
        descriptionLabel.numberOfLines = article.expanded ? 0 : defaultLinesNumber
        backgroundColor = .paleGreen
    }
}
