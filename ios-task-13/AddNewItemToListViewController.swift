import UIKit

class AddNewItemToListViewController: UIViewController, UINavigationControllerDelegate {
    
    private let saveButton = UIButton()
    private let songName = UITextField()
    var mainViewController: ViewController?
    let addImage = UIButton()
    var imageBox: UIImage?
    let imagePreviw = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        songName.backgroundColor = .white
        
        setupSaveButton()
        setupAddImage()
        addSubviews()
        setupConstrains()
    }
    
    
    func setupSaveButton() {
        saveButton.setTitle("Save", for: .normal)
        
        saveButton.addAction(UIAction(handler: { (action: UIAction) in
            let image = self.imageBox ?? UIImage()
            let name = self.songName.text ?? ""
            
            if name != "" {
                let song = Song(name: name, image: image)
                self.mainViewController?.addSong(song: song)
                self.dismiss(animated: true)
            }
        }), for: .touchUpInside)
    }
    
    func setupAddImage() {
        addImage.setTitle("Select Image", for: .normal)
        
        addImage.addAction(UIAction(handler: { (action: UIAction) in
            let picker = UIImagePickerController()
            picker.delegate = self
            self.present(picker, animated: true)
        }), for: .touchUpInside)
    }
    
    func addSubviews() {
        view.addSubview(saveButton)
        view.addSubview(songName)
        view.addSubview(addImage)
        view.addSubview(imagePreviw)
    }
    
    func setupConstrains() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        songName.translatesAutoresizingMaskIntoConstraints = false
        songName.topAnchor.constraint(equalTo: saveButton.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        songName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        songName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        songName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        addImage.translatesAutoresizingMaskIntoConstraints = false
        addImage.topAnchor.constraint(equalTo: songName.bottomAnchor, constant: 10).isActive = true
        addImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        addImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        imagePreviw.translatesAutoresizingMaskIntoConstraints = false
        imagePreviw.topAnchor.constraint(equalTo: addImage.bottomAnchor, constant: 10).isActive = true
        imagePreviw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        imagePreviw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        imagePreviw.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
    }
}

extension AddNewItemToListViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        imageBox = selectedImage
        imagePreviw.image = selectedImage
        picker.dismiss(animated: true)
    }
}

