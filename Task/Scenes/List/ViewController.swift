import UIKit
import RxSwift
import RxDataSources

final class ViewController: UIViewController {
//    private struct MySection: SectionModelType {}
    
    private let _bag = DisposeBag()
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.servers
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "Cell")) { index, model, cell in
                cell.textLabel?.text = model.name
                cell.detailTextLabel?.text = "\(model.distance) km"
        }
        .disposed(by: _bag)
        
    }
}
