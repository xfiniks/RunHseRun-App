struct GameViewModel: Equatable {

    let audiences: [String]
    let currentAudience: String
    let completion: (PredictResult) -> Void

    static func == (lhs: GameViewModel, rhs: GameViewModel) -> Bool {
        return lhs.currentAudience == rhs.currentAudience
    }
}

