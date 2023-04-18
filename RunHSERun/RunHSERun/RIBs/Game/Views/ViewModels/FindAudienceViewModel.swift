struct FindAudienceViewModel: Equatable {

    // MARK: - Internal Types

    struct Row: Equatable {

        let title: String
        let id: Int

    }

    // MARK: - Internal Properties

    var rows: [Row]

}
