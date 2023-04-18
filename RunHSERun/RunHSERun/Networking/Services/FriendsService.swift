import GRPC
import NIO
import NIOHPACK
import SwiftProtobuf
import Foundation

final class FriendsService {

    private var client: Run_Hse_Run_FriendServiceNIOClient?

    init(grpcChannel: GRPCChannel?) {
        guard let grpcChannel = grpcChannel else {
            return
        }

        client = Run_Hse_Run_FriendServiceNIOClient(channel: grpcChannel)
    }


    func makeAddFriendRequest(with req: Run_Hse_Run_AddFriendRequest, token: String, completion: @escaping (VoidResult) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)
        let call = client.addFriend(req, callOptions: callOptions)

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let response = try call.response.wait()
                DispatchQueue.main.async {
                    completion(.success)
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    func makeDeleteFriendRequest(with req: Run_Hse_Run_DeleteFriendRequest, token: String, completion: @escaping (VoidResult) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)
        let call = client.deleteFriend(req, callOptions: callOptions)

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let response = try call.response.wait()
                DispatchQueue.main.async {
                    completion(.success)
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    func makeGetFriendsRequest(token: String, completion: @escaping (Result<Run_Hse_Run_Users, Error>) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)
        let call = client.getFriends(Google_Protobuf_Empty(), callOptions: callOptions)

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let response = try call.response.wait()
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

}

