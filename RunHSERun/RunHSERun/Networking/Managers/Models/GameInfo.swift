struct GameInfo {

    let opponentNickname: String
    let gameID: Int
    let rooms: [Room]

}

extension GameInfo {

    init(_ info: Run_Hse_Run_GameInfo) {
        self.opponentNickname = info.opponentNickname
        self.gameID = Int(info.gameID)
        self.rooms = info.rooms.map { Room($0) }
    }

}
