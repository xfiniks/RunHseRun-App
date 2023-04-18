enum AuthVerifyResponse {
    case needRegistration
    case moveNext
}

enum AuthRegisterResponse {
    case moveNext
}

enum StreamResponse {
    case gameInfo(info: Run_Hse_Run_GameInfo)
    case gameResult(result: String)
}
