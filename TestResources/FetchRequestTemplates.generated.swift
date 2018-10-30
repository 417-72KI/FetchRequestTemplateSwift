import CoreData

extension NSManagedObjectModel {
    struct FetchRequestTemplate {
        fileprivate let model: NSManagedObjectModel
    }

    var template: FetchRequestTemplate {
        return FetchRequestTemplate(model: self)
    }
}

extension NSManagedObjectModel.FetchRequestTemplate {
    var allTransactions: NSFetchRequest<Transaction> {
        return model.fetchRequestTemplate(forName: "AllTransactions") as! NSFetchRequest<Transaction>
    }

    func transaction(withAccountId accountId: Int) -> NSFetchRequest<Transaction> {
        return model.fetchRequestFromTemplate(withName: "TransactionWithAccountId", substitutionVariables: ["accountId": accountId]) as! NSFetchRequest<Transaction>
    }

    func transaction(withAccountId accountId: Int, andDate date: Date) -> NSFetchRequest<Transaction> {
        return model.fetchRequestFromTemplate(withName: "TransactionWithAccountIdAndDate", substitutionVariables: ["accountId": accountId, "date": date as NSDate]) as! NSFetchRequest<Transaction>
    }
}
