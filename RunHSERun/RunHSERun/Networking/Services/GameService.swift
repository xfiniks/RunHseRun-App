import GRPC
import NIO
import SwiftProtobuf
import Foundation
import NIOHPACK

final class GameService {

    private var client: Run_Hse_Run_GameServiceNIOClient?

    init(grpcChannel: GRPCChannel?) {
        guard let grpcChannel = grpcChannel else {
            return
        }

        client = Run_Hse_Run_GameServiceNIOClient(channel: grpcChannel)
    }

    func makePutInQueueRequest(with req: Run_Hse_Run_PutInQueueRequest,
                    token: String,
                    completion: @escaping (VoidResult) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)
        let call = client.putInQueue(req, callOptions: callOptions)

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let response = try call.response.wait()
                DispatchQueue.main.async {
                    completion(.success)
                }
            }
            catch {
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
    }

    func makeSendTimeRequest(with req: Run_Hse_Run_SendTimeRequest,
                  token: String,
                  completion: @escaping (VoidResult) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)
        let call = client.sendTime(req, callOptions: callOptions)

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

    func makeDeleteFromQueueRequest(token: String, completion: @escaping (VoidResult) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)
        let call = client.deleteFromQueue(Google_Protobuf_Empty(), callOptions: callOptions)

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let response = try call.response.wait()
                DispatchQueue.main.async {
                    completion(.success)
                }
            }
            catch {
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
    }

    func makeGetRoomsByCodeRequest(with req: Run_Hse_Run_GetRoomByCodeRequest,
                                   token: String,
                                   completion: @escaping (Result<Run_Hse_Run_GetRoomByCodeResponse, Error>) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let headers: HPACKHeaders = ["authorization": token]
        let callOptions = CallOptions(customMetadata: headers)
        let call = client.getRoomsByCode(req, callOptions: callOptions)

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let response = try call.response.wait()
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            }
            catch {
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
    }

}

