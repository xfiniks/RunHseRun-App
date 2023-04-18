import UIKit
import RIBs
import MHLoadingButton

final class QrViewController: UIViewController {

    // MARK: - Internal Properties

    private var qr: UIImageView!

    override func loadView() {
        view = UIView()
        addSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        applyColorScheme()
    }

    private func configureUI() {
        qr.image = generateQRCode(from: UserDataKeeperImpl().getUserNickname() ?? "xfiniks")
    }

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        if let QRFilter = CIFilter(name: "CIQRCodeGenerator") {
            QRFilter.setValue(data, forKey: "inputMessage")
            guard let QRImage = QRFilter.outputImage else {return nil}
            return UIImage(ciImage: QRImage)
        }
        return nil
    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
    }

    private func addSubviews() {
        qr = UIImageView()
        qr.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(qr)

        NSLayoutConstraint.activate([
            qr.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            qr.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            qr.heightAnchor.constraint(equalToConstant: 300),
            qr.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

}
