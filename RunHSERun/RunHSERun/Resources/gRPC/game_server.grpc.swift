//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: game_server.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Usage: instantiate `Run_Hse_Run_GameServiceClient`, then call methods of this protocol to make API calls.
internal protocol Run_Hse_Run_GameServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol? { get }

  func getRoomsByCode(
    _ request: Run_Hse_Run_GetRoomByCodeRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Run_Hse_Run_GetRoomByCodeRequest, Run_Hse_Run_GetRoomByCodeResponse>

  func putInQueue(
    _ request: Run_Hse_Run_PutInQueueRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Run_Hse_Run_PutInQueueRequest, SwiftProtobuf.Google_Protobuf_Empty>

  func deleteFromQueue(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions?
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_Empty, SwiftProtobuf.Google_Protobuf_Empty>

  func addCall(
    _ request: Run_Hse_Run_AddCallRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Run_Hse_Run_AddCallRequest, SwiftProtobuf.Google_Protobuf_Empty>

  func deleteCall(
    _ request: Run_Hse_Run_DeleteCallRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Run_Hse_Run_DeleteCallRequest, SwiftProtobuf.Google_Protobuf_Empty>

  func sendTime(
    _ request: Run_Hse_Run_SendTimeRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Run_Hse_Run_SendTimeRequest, SwiftProtobuf.Google_Protobuf_Empty>

  func streamGame(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions?,
    handler: @escaping (Run_Hse_Run_StreamResponse) -> Void
  ) -> ServerStreamingCall<SwiftProtobuf.Google_Protobuf_Empty, Run_Hse_Run_StreamResponse>
}

extension Run_Hse_Run_GameServiceClientProtocol {
  internal var serviceName: String {
    return "run.hse.run.GameService"
  }

  /// Unary call to GetRoomsByCode
  ///
  /// - Parameters:
  ///   - request: Request to send to GetRoomsByCode.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getRoomsByCode(
    _ request: Run_Hse_Run_GetRoomByCodeRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Run_Hse_Run_GetRoomByCodeRequest, Run_Hse_Run_GetRoomByCodeResponse> {
    return self.makeUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.getRoomsByCode.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetRoomsByCodeInterceptors() ?? []
    )
  }

  /// Unary call to PutInQueue
  ///
  /// - Parameters:
  ///   - request: Request to send to PutInQueue.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func putInQueue(
    _ request: Run_Hse_Run_PutInQueueRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Run_Hse_Run_PutInQueueRequest, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.putInQueue.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePutInQueueInterceptors() ?? []
    )
  }

  /// Unary call to DeleteFromQueue
  ///
  /// - Parameters:
  ///   - request: Request to send to DeleteFromQueue.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deleteFromQueue(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_Empty, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.deleteFromQueue.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteFromQueueInterceptors() ?? []
    )
  }

  /// Unary call to AddCall
  ///
  /// - Parameters:
  ///   - request: Request to send to AddCall.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func addCall(
    _ request: Run_Hse_Run_AddCallRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Run_Hse_Run_AddCallRequest, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.addCall.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAddCallInterceptors() ?? []
    )
  }

  /// Unary call to DeleteCall
  ///
  /// - Parameters:
  ///   - request: Request to send to DeleteCall.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deleteCall(
    _ request: Run_Hse_Run_DeleteCallRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Run_Hse_Run_DeleteCallRequest, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.deleteCall.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteCallInterceptors() ?? []
    )
  }

  /// Unary call to SendTime
  ///
  /// - Parameters:
  ///   - request: Request to send to SendTime.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func sendTime(
    _ request: Run_Hse_Run_SendTimeRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Run_Hse_Run_SendTimeRequest, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.sendTime.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSendTimeInterceptors() ?? []
    )
  }

  /// Server streaming call to StreamGame
  ///
  /// - Parameters:
  ///   - request: Request to send to StreamGame.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  internal func streamGame(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil,
    handler: @escaping (Run_Hse_Run_StreamResponse) -> Void
  ) -> ServerStreamingCall<SwiftProtobuf.Google_Protobuf_Empty, Run_Hse_Run_StreamResponse> {
    return self.makeServerStreamingCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.streamGame.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeStreamGameInterceptors() ?? [],
      handler: handler
    )
  }
}

#if compiler(>=5.6)
@available(*, deprecated)
extension Run_Hse_Run_GameServiceClient: @unchecked Sendable {}
#endif // compiler(>=5.6)

@available(*, deprecated, renamed: "Run_Hse_Run_GameServiceNIOClient")
internal final class Run_Hse_Run_GameServiceClient: Run_Hse_Run_GameServiceClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the run.hse.run.GameService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Run_Hse_Run_GameServiceNIOClient: Run_Hse_Run_GameServiceClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the run.hse.run.GameService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

#if compiler(>=5.6)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Run_Hse_Run_GameServiceAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol? { get }

  func makeGetRoomsByCodeCall(
    _ request: Run_Hse_Run_GetRoomByCodeRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Run_Hse_Run_GetRoomByCodeRequest, Run_Hse_Run_GetRoomByCodeResponse>

  func makePutInQueueCall(
    _ request: Run_Hse_Run_PutInQueueRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Run_Hse_Run_PutInQueueRequest, SwiftProtobuf.Google_Protobuf_Empty>

  func makeDeleteFromQueueCall(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<SwiftProtobuf.Google_Protobuf_Empty, SwiftProtobuf.Google_Protobuf_Empty>

  func makeAddCallCall(
    _ request: Run_Hse_Run_AddCallRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Run_Hse_Run_AddCallRequest, SwiftProtobuf.Google_Protobuf_Empty>

  func makeDeleteCallCall(
    _ request: Run_Hse_Run_DeleteCallRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Run_Hse_Run_DeleteCallRequest, SwiftProtobuf.Google_Protobuf_Empty>

  func makeSendTimeCall(
    _ request: Run_Hse_Run_SendTimeRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Run_Hse_Run_SendTimeRequest, SwiftProtobuf.Google_Protobuf_Empty>

  func makeStreamGameCall(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions?
  ) -> GRPCAsyncServerStreamingCall<SwiftProtobuf.Google_Protobuf_Empty, Run_Hse_Run_StreamResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Run_Hse_Run_GameServiceAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Run_Hse_Run_GameServiceClientMetadata.serviceDescriptor
  }

  internal var interceptors: Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeGetRoomsByCodeCall(
    _ request: Run_Hse_Run_GetRoomByCodeRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Run_Hse_Run_GetRoomByCodeRequest, Run_Hse_Run_GetRoomByCodeResponse> {
    return self.makeAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.getRoomsByCode.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetRoomsByCodeInterceptors() ?? []
    )
  }

  internal func makePutInQueueCall(
    _ request: Run_Hse_Run_PutInQueueRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Run_Hse_Run_PutInQueueRequest, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.putInQueue.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePutInQueueInterceptors() ?? []
    )
  }

  internal func makeDeleteFromQueueCall(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<SwiftProtobuf.Google_Protobuf_Empty, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.deleteFromQueue.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteFromQueueInterceptors() ?? []
    )
  }

  internal func makeAddCallCall(
    _ request: Run_Hse_Run_AddCallRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Run_Hse_Run_AddCallRequest, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.addCall.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAddCallInterceptors() ?? []
    )
  }

  internal func makeDeleteCallCall(
    _ request: Run_Hse_Run_DeleteCallRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Run_Hse_Run_DeleteCallRequest, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.deleteCall.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteCallInterceptors() ?? []
    )
  }

  internal func makeSendTimeCall(
    _ request: Run_Hse_Run_SendTimeRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Run_Hse_Run_SendTimeRequest, SwiftProtobuf.Google_Protobuf_Empty> {
    return self.makeAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.sendTime.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSendTimeInterceptors() ?? []
    )
  }

  internal func makeStreamGameCall(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncServerStreamingCall<SwiftProtobuf.Google_Protobuf_Empty, Run_Hse_Run_StreamResponse> {
    return self.makeAsyncServerStreamingCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.streamGame.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeStreamGameInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Run_Hse_Run_GameServiceAsyncClientProtocol {
  internal func getRoomsByCode(
    _ request: Run_Hse_Run_GetRoomByCodeRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Run_Hse_Run_GetRoomByCodeResponse {
    return try await self.performAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.getRoomsByCode.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetRoomsByCodeInterceptors() ?? []
    )
  }

  internal func putInQueue(
    _ request: Run_Hse_Run_PutInQueueRequest,
    callOptions: CallOptions? = nil
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try await self.performAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.putInQueue.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePutInQueueInterceptors() ?? []
    )
  }

  internal func deleteFromQueue(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try await self.performAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.deleteFromQueue.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteFromQueueInterceptors() ?? []
    )
  }

  internal func addCall(
    _ request: Run_Hse_Run_AddCallRequest,
    callOptions: CallOptions? = nil
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try await self.performAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.addCall.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAddCallInterceptors() ?? []
    )
  }

  internal func deleteCall(
    _ request: Run_Hse_Run_DeleteCallRequest,
    callOptions: CallOptions? = nil
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try await self.performAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.deleteCall.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeleteCallInterceptors() ?? []
    )
  }

  internal func sendTime(
    _ request: Run_Hse_Run_SendTimeRequest,
    callOptions: CallOptions? = nil
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty {
    return try await self.performAsyncUnaryCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.sendTime.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSendTimeInterceptors() ?? []
    )
  }

  internal func streamGame(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncResponseStream<Run_Hse_Run_StreamResponse> {
    return self.performAsyncServerStreamingCall(
      path: Run_Hse_Run_GameServiceClientMetadata.Methods.streamGame.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeStreamGameInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Run_Hse_Run_GameServiceAsyncClient: Run_Hse_Run_GameServiceAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

#endif // compiler(>=5.6)

internal protocol Run_Hse_Run_GameServiceClientInterceptorFactoryProtocol: GRPCSendable {

  /// - Returns: Interceptors to use when invoking 'getRoomsByCode'.
  func makeGetRoomsByCodeInterceptors() -> [ClientInterceptor<Run_Hse_Run_GetRoomByCodeRequest, Run_Hse_Run_GetRoomByCodeResponse>]

  /// - Returns: Interceptors to use when invoking 'putInQueue'.
  func makePutInQueueInterceptors() -> [ClientInterceptor<Run_Hse_Run_PutInQueueRequest, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when invoking 'deleteFromQueue'.
  func makeDeleteFromQueueInterceptors() -> [ClientInterceptor<SwiftProtobuf.Google_Protobuf_Empty, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when invoking 'addCall'.
  func makeAddCallInterceptors() -> [ClientInterceptor<Run_Hse_Run_AddCallRequest, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when invoking 'deleteCall'.
  func makeDeleteCallInterceptors() -> [ClientInterceptor<Run_Hse_Run_DeleteCallRequest, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when invoking 'sendTime'.
  func makeSendTimeInterceptors() -> [ClientInterceptor<Run_Hse_Run_SendTimeRequest, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when invoking 'streamGame'.
  func makeStreamGameInterceptors() -> [ClientInterceptor<SwiftProtobuf.Google_Protobuf_Empty, Run_Hse_Run_StreamResponse>]
}

internal enum Run_Hse_Run_GameServiceClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "GameService",
    fullName: "run.hse.run.GameService",
    methods: [
      Run_Hse_Run_GameServiceClientMetadata.Methods.getRoomsByCode,
      Run_Hse_Run_GameServiceClientMetadata.Methods.putInQueue,
      Run_Hse_Run_GameServiceClientMetadata.Methods.deleteFromQueue,
      Run_Hse_Run_GameServiceClientMetadata.Methods.addCall,
      Run_Hse_Run_GameServiceClientMetadata.Methods.deleteCall,
      Run_Hse_Run_GameServiceClientMetadata.Methods.sendTime,
      Run_Hse_Run_GameServiceClientMetadata.Methods.streamGame,
    ]
  )

  internal enum Methods {
    internal static let getRoomsByCode = GRPCMethodDescriptor(
      name: "GetRoomsByCode",
      path: "/run.hse.run.GameService/GetRoomsByCode",
      type: GRPCCallType.unary
    )

    internal static let putInQueue = GRPCMethodDescriptor(
      name: "PutInQueue",
      path: "/run.hse.run.GameService/PutInQueue",
      type: GRPCCallType.unary
    )

    internal static let deleteFromQueue = GRPCMethodDescriptor(
      name: "DeleteFromQueue",
      path: "/run.hse.run.GameService/DeleteFromQueue",
      type: GRPCCallType.unary
    )

    internal static let addCall = GRPCMethodDescriptor(
      name: "AddCall",
      path: "/run.hse.run.GameService/AddCall",
      type: GRPCCallType.unary
    )

    internal static let deleteCall = GRPCMethodDescriptor(
      name: "DeleteCall",
      path: "/run.hse.run.GameService/DeleteCall",
      type: GRPCCallType.unary
    )

    internal static let sendTime = GRPCMethodDescriptor(
      name: "SendTime",
      path: "/run.hse.run.GameService/SendTime",
      type: GRPCCallType.unary
    )

    internal static let streamGame = GRPCMethodDescriptor(
      name: "StreamGame",
      path: "/run.hse.run.GameService/StreamGame",
      type: GRPCCallType.serverStreaming
    )
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Run_Hse_Run_GameServiceProvider: CallHandlerProvider {
  var interceptors: Run_Hse_Run_GameServiceServerInterceptorFactoryProtocol? { get }

  func getRoomsByCode(request: Run_Hse_Run_GetRoomByCodeRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Run_Hse_Run_GetRoomByCodeResponse>

  func putInQueue(request: Run_Hse_Run_PutInQueueRequest, context: StatusOnlyCallContext) -> EventLoopFuture<SwiftProtobuf.Google_Protobuf_Empty>

  func deleteFromQueue(request: SwiftProtobuf.Google_Protobuf_Empty, context: StatusOnlyCallContext) -> EventLoopFuture<SwiftProtobuf.Google_Protobuf_Empty>

  func addCall(request: Run_Hse_Run_AddCallRequest, context: StatusOnlyCallContext) -> EventLoopFuture<SwiftProtobuf.Google_Protobuf_Empty>

  func deleteCall(request: Run_Hse_Run_DeleteCallRequest, context: StatusOnlyCallContext) -> EventLoopFuture<SwiftProtobuf.Google_Protobuf_Empty>

  func sendTime(request: Run_Hse_Run_SendTimeRequest, context: StatusOnlyCallContext) -> EventLoopFuture<SwiftProtobuf.Google_Protobuf_Empty>

  func streamGame(request: SwiftProtobuf.Google_Protobuf_Empty, context: StreamingResponseCallContext<Run_Hse_Run_StreamResponse>) -> EventLoopFuture<GRPCStatus>
}

extension Run_Hse_Run_GameServiceProvider {
  internal var serviceName: Substring {
    return Run_Hse_Run_GameServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "GetRoomsByCode":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Run_Hse_Run_GetRoomByCodeRequest>(),
        responseSerializer: ProtobufSerializer<Run_Hse_Run_GetRoomByCodeResponse>(),
        interceptors: self.interceptors?.makeGetRoomsByCodeInterceptors() ?? [],
        userFunction: self.getRoomsByCode(request:context:)
      )

    case "PutInQueue":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Run_Hse_Run_PutInQueueRequest>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makePutInQueueInterceptors() ?? [],
        userFunction: self.putInQueue(request:context:)
      )

    case "DeleteFromQueue":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makeDeleteFromQueueInterceptors() ?? [],
        userFunction: self.deleteFromQueue(request:context:)
      )

    case "AddCall":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Run_Hse_Run_AddCallRequest>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makeAddCallInterceptors() ?? [],
        userFunction: self.addCall(request:context:)
      )

    case "DeleteCall":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Run_Hse_Run_DeleteCallRequest>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makeDeleteCallInterceptors() ?? [],
        userFunction: self.deleteCall(request:context:)
      )

    case "SendTime":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Run_Hse_Run_SendTimeRequest>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makeSendTimeInterceptors() ?? [],
        userFunction: self.sendTime(request:context:)
      )

    case "StreamGame":
      return ServerStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        responseSerializer: ProtobufSerializer<Run_Hse_Run_StreamResponse>(),
        interceptors: self.interceptors?.makeStreamGameInterceptors() ?? [],
        userFunction: self.streamGame(request:context:)
      )

    default:
      return nil
    }
  }
}

#if compiler(>=5.6)

/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Run_Hse_Run_GameServiceAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Run_Hse_Run_GameServiceServerInterceptorFactoryProtocol? { get }

  @Sendable func getRoomsByCode(
    request: Run_Hse_Run_GetRoomByCodeRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Run_Hse_Run_GetRoomByCodeResponse

  @Sendable func putInQueue(
    request: Run_Hse_Run_PutInQueueRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty

  @Sendable func deleteFromQueue(
    request: SwiftProtobuf.Google_Protobuf_Empty,
    context: GRPCAsyncServerCallContext
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty

  @Sendable func addCall(
    request: Run_Hse_Run_AddCallRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty

  @Sendable func deleteCall(
    request: Run_Hse_Run_DeleteCallRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty

  @Sendable func sendTime(
    request: Run_Hse_Run_SendTimeRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> SwiftProtobuf.Google_Protobuf_Empty

  @Sendable func streamGame(
    request: SwiftProtobuf.Google_Protobuf_Empty,
    responseStream: GRPCAsyncResponseStreamWriter<Run_Hse_Run_StreamResponse>,
    context: GRPCAsyncServerCallContext
  ) async throws
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Run_Hse_Run_GameServiceAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Run_Hse_Run_GameServiceServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Run_Hse_Run_GameServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Run_Hse_Run_GameServiceServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "GetRoomsByCode":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Run_Hse_Run_GetRoomByCodeRequest>(),
        responseSerializer: ProtobufSerializer<Run_Hse_Run_GetRoomByCodeResponse>(),
        interceptors: self.interceptors?.makeGetRoomsByCodeInterceptors() ?? [],
        wrapping: self.getRoomsByCode(request:context:)
      )

    case "PutInQueue":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Run_Hse_Run_PutInQueueRequest>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makePutInQueueInterceptors() ?? [],
        wrapping: self.putInQueue(request:context:)
      )

    case "DeleteFromQueue":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makeDeleteFromQueueInterceptors() ?? [],
        wrapping: self.deleteFromQueue(request:context:)
      )

    case "AddCall":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Run_Hse_Run_AddCallRequest>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makeAddCallInterceptors() ?? [],
        wrapping: self.addCall(request:context:)
      )

    case "DeleteCall":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Run_Hse_Run_DeleteCallRequest>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makeDeleteCallInterceptors() ?? [],
        wrapping: self.deleteCall(request:context:)
      )

    case "SendTime":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Run_Hse_Run_SendTimeRequest>(),
        responseSerializer: ProtobufSerializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        interceptors: self.interceptors?.makeSendTimeInterceptors() ?? [],
        wrapping: self.sendTime(request:context:)
      )

    case "StreamGame":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        responseSerializer: ProtobufSerializer<Run_Hse_Run_StreamResponse>(),
        interceptors: self.interceptors?.makeStreamGameInterceptors() ?? [],
        wrapping: self.streamGame(request:responseStream:context:)
      )

    default:
      return nil
    }
  }
}

#endif // compiler(>=5.6)

internal protocol Run_Hse_Run_GameServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'getRoomsByCode'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetRoomsByCodeInterceptors() -> [ServerInterceptor<Run_Hse_Run_GetRoomByCodeRequest, Run_Hse_Run_GetRoomByCodeResponse>]

  /// - Returns: Interceptors to use when handling 'putInQueue'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makePutInQueueInterceptors() -> [ServerInterceptor<Run_Hse_Run_PutInQueueRequest, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when handling 'deleteFromQueue'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDeleteFromQueueInterceptors() -> [ServerInterceptor<SwiftProtobuf.Google_Protobuf_Empty, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when handling 'addCall'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeAddCallInterceptors() -> [ServerInterceptor<Run_Hse_Run_AddCallRequest, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when handling 'deleteCall'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDeleteCallInterceptors() -> [ServerInterceptor<Run_Hse_Run_DeleteCallRequest, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when handling 'sendTime'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSendTimeInterceptors() -> [ServerInterceptor<Run_Hse_Run_SendTimeRequest, SwiftProtobuf.Google_Protobuf_Empty>]

  /// - Returns: Interceptors to use when handling 'streamGame'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeStreamGameInterceptors() -> [ServerInterceptor<SwiftProtobuf.Google_Protobuf_Empty, Run_Hse_Run_StreamResponse>]
}

internal enum Run_Hse_Run_GameServiceServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "GameService",
    fullName: "run.hse.run.GameService",
    methods: [
      Run_Hse_Run_GameServiceServerMetadata.Methods.getRoomsByCode,
      Run_Hse_Run_GameServiceServerMetadata.Methods.putInQueue,
      Run_Hse_Run_GameServiceServerMetadata.Methods.deleteFromQueue,
      Run_Hse_Run_GameServiceServerMetadata.Methods.addCall,
      Run_Hse_Run_GameServiceServerMetadata.Methods.deleteCall,
      Run_Hse_Run_GameServiceServerMetadata.Methods.sendTime,
      Run_Hse_Run_GameServiceServerMetadata.Methods.streamGame,
    ]
  )

  internal enum Methods {
    internal static let getRoomsByCode = GRPCMethodDescriptor(
      name: "GetRoomsByCode",
      path: "/run.hse.run.GameService/GetRoomsByCode",
      type: GRPCCallType.unary
    )

    internal static let putInQueue = GRPCMethodDescriptor(
      name: "PutInQueue",
      path: "/run.hse.run.GameService/PutInQueue",
      type: GRPCCallType.unary
    )

    internal static let deleteFromQueue = GRPCMethodDescriptor(
      name: "DeleteFromQueue",
      path: "/run.hse.run.GameService/DeleteFromQueue",
      type: GRPCCallType.unary
    )

    internal static let addCall = GRPCMethodDescriptor(
      name: "AddCall",
      path: "/run.hse.run.GameService/AddCall",
      type: GRPCCallType.unary
    )

    internal static let deleteCall = GRPCMethodDescriptor(
      name: "DeleteCall",
      path: "/run.hse.run.GameService/DeleteCall",
      type: GRPCCallType.unary
    )

    internal static let sendTime = GRPCMethodDescriptor(
      name: "SendTime",
      path: "/run.hse.run.GameService/SendTime",
      type: GRPCCallType.unary
    )

    internal static let streamGame = GRPCMethodDescriptor(
      name: "StreamGame",
      path: "/run.hse.run.GameService/StreamGame",
      type: GRPCCallType.serverStreaming
    )
  }
}