import UIKit

class ItemDetailsViewController: UIViewController {
    
    let songLabel = UILabel()
    let songImage = UIImageView()
    var song: Song? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(songLabel)
        view.addSubview(songImage)
        
        songLabel.text = song?.name
        songImage.image = song?.image.scalePreservingAspectRatio(targetSize: CGSize(width: 300, height: 300))
        
        setupConstrains()
        
    }
    
    func setupConstrains() {
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        songLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        songLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        songLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        songImage.translatesAutoresizingMaskIntoConstraints = false
        songImage.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 5).isActive = true
        songImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        songImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }

}
