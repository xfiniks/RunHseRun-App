import GRPC
import NIO

final class GRPCChannelProvider {

    var grpcChannel: GRPCChannel?

    init() {
        let group = PlatformSupport.makeEventLoopGroup(loopCount: System.coreCount)

        do {
            grpcChannel = try GRPCChannelPool.with(
                target: .host("158.160.0.28", port: 8000),
                transportSecurity: .plaintext,
                eventLoopGroup: group
            )
        }
        catch {
            print("Server connection error.")
        }
    }

}
