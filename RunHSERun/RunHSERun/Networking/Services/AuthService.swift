import GRPC
import NIO
import Foundation

final class AuthService {

    private var client: Run_Hse_Run_AuthServiceNIOClient?

    init(grpcChannel: GRPCChannel?) {
        guard let grpcChannel = grpcChannel else {
            return
        }

        client = Run_Hse_Run_AuthServiceNIOClient(channel: grpcChannel)
    }


    func makeRegistrationRequest(with req: Run_Hse_Run_User, completion: @escaping (Result<Run_Hse_Run_UserWithToken, Error>) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let call = client.registration(req)

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

    func makeVerifyRequest(with req: Run_Hse_Run_VerifyRequest, completion: @escaping (Result<Run_Hse_Run_VerifyResponse, Error>) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let call = client.verify(req)

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

    func makeSendVerifyEmailRequest(with req: Run_Hse_Run_SendVerifyEmailRequest, completion: @escaping (VoidResult) -> Void) {
        guard let client = client else {
            print("Client is nil")
            completion(.failure(RequestError.clientIsNil))
            return
        }

        let call = client.sendVerifyEmail(req)

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let _ = try call.response.wait()
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

}
