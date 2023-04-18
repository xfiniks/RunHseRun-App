import Foundation
import GRPC
import SwiftProtobuf
import NIOCore
import NIOPosix
import NIOHPACK


final class GRPCStream {

    private var client: Run_Hse_Run_GameServiceAsyncClient?

    init(grpcChannel: GRPCChannel?) {
        guard let grpcChannel = grpcChannel else {
            return
        }

        self.client = Run_Hse_Run_GameServiceAsyncClient(channel: grpcChannel)
    }

    func startGame(token: String, completion: @escaping (Result<StreamResponse, Error>) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        Task(priority: .userInitiated) {
            do {
                try await withThrowingTaskGroup(of: Void.self) { group in
                    let headers: HPACKHeaders = ["authorization": token]
                    let callOptions = CallOptions(customMetadata: headers)
                    let stream = client.makeStreamGameCall(Google_Protobuf_Empty(), callOptions: callOptions)
                    group.addTask(priority: .userInitiated) {
                        for try await response in stream.responseStream {
                            print(response)
                            switch response.result {
                            case .gameInfo(let info):
                                completion(.success(.gameInfo(info: info)))

                            case .gameResult(let result):
                                completion(.success(.gameResult(result: result)))

                            case .none:
                                print("Server send nil.")
                            }
                        }
                    }

                    try await group.waitForAll()
                }
            }
            catch {
                completion(.failure(error))
            }
        }

    }

}
