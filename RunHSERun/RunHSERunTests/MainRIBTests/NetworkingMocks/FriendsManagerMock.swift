@testable import RunHSERun
import GRPC

final class FriendsManagerMock: FriendsManager {

    var error: Error?

    func makeChangeImageRequest(newImage: String, completion: @escaping (VoidResult) -> Void) {
        // Do nothing
    }

    func makeAddFriendRequest(userId: Int, completion: @escaping (VoidResult) -> Void) {
        // Do nothing
    }

    func makeDeleteFriendRequest(userId: Int, completion: @escaping (VoidResult) -> Void) {
        // Do nothing
    }

    func makeGetFriendsRequest(completion: @escaping (Result<Run_Hse_Run_Users, Error>) -> Void) {
        // Do nothing
    }

}
