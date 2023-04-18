import GRPC
import NIO
import NIOHPACK
import SwiftProtobuf
import Foundation

final class UserService {

    private var client: Run_Hse_Run_UserServiceNIOClient?

    init(grpcChannel: GRPCChannel?) {
        guard let grpcChannel = grpcChannel else {
            return
        }

        client = Run_Hse_Run_UserServiceNIOClient(channel: grpcChannel)
    }


    func makeChangeImageRequest(with req: Run_Hse_Run_ChangeImageRequest, token: String, completion: @escaping (VoidResult) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)
        let call = client.changeImage(req, callOptions: callOptions)

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

    func makeGetMeRequest(token: String, completion: @escaping (Result<Run_Hse_Run_User, Error>) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)

        let call = client.getMe(SwiftProtobuf.Google_Protobuf_Empty(), callOptions: callOptions)

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

    func makeChangeNicknameRequest(with req: Run_Hse_Run_ChangeNicknameRequest,
                                   token: String,
                                   completion: @escaping (VoidResult) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)

        let call = client.changeNickname(req, callOptions: callOptions)

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

    func makeGetLeaderboardRequest(token: String, completion: @escaping (Result<Run_Hse_Run_Users, Error>) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)

        let call = client.getLeaderBoard(Google_Protobuf_Empty(), callOptions: callOptions)

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

    func makeGetUserByIdRequest(with req: Run_Hse_Run_GetUserByIDRequest,
                                token: String,
                                completion: @escaping (Result<Run_Hse_Run_User, Error>) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)

        let call = client.getUserByID(req, callOptions: callOptions)

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

    func makeGetUserByNicknameRequest(with req: Run_Hse_Run_GetUserByNicknameRequest,
                                token: String,
                                completion: @escaping (Result<Run_Hse_Run_Users, Error>) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)

        let call = client.getUserByNickname(req, callOptions: callOptions)

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
