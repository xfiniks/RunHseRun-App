extension Int {

    var toTime: String {
        var minutes = String(self / 60)
        var seconds = String(self % 60)

        if (self / 60 < 10) {
            minutes = "0\(minutes)"
        }
        if (self % 60 < 10) {
            seconds = "0\(seconds)"
        }
        
        return "\(minutes):\(seconds)"
    }

}
