import UIKit

// source: https://www.advancedswift.com/resize-uiimage-no-stretching-swift/
extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}

class ViewController: UIViewController {
    private var dataList: [Song] = []
    private let addButton = UIButton()
    private let tableList = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupTableList()
        setupTableButton()
        addSubviews()
        setupConstrains()
    }

    
    func addSong(song: Song) {
        dataList.append(song)
        tableList.reloadData()
    }
    
    func setupTableList() {
        tableList.register(Cell.self, forCellReuseIdentifier: "Cell")
        tableList.dataSource = self
        tableList.delegate = self
    }
    
    func setupTableButton() {
        addButton.backgroundColor = .systemRed
        addButton.setTitle("+ Add", for: .normal)
        addButton.addAction(UIAction(handler: { action in
            let newItemController = AddNewItemToListViewController()
            newItemController.mainViewController = self
            self.present(newItemController, animated: true)
        }), for: .touchUpInside)
    }
    
    func addSubviews() {
        view.addSubview(addButton)
        view.addSubview(tableList)
    }
    
    func setupConstrains() {
        tableList.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableList.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            tableList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableList.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell
        cell?.configure(song: dataList[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDetailsViewController = ItemDetailsViewController()
        itemDetailsViewController.song = dataList[indexPath.row]
        navigationController?.pushViewController(itemDetailsViewController, animated: true)
    }
}
