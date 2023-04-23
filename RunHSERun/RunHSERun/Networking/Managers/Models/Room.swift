struct Room {

    let id: Int
    let code: String
    let campusId: Int

}

extension Room {

    init(_ room: Run_Hse_Run_Room) {
        self.id = Int(room.id)
        self.code = room.code
        self.campusId = Int(room.campusID)
    }

}
