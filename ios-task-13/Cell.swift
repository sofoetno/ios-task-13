import UIKit

class Cell: UITableViewCell {
    var label = UILabel()
    var image = UIImageView()
    var song: Song?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        addSubview(label)
        addSubview(image)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15).isActive = true
    }
    
    func configure(song: Song) {
        self.song = song
        
        label.text = song.name
        image.image = song.image.scalePreservingAspectRatio(targetSize: CGSize(width: 50, height: 50))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
