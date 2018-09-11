import SDL2

public extension sdl {
	public struct cpu {
		private init() {}
		public static var cacheLineSize: Int {
			get { return Int(SDL_GetCPUCacheLineSize()) }
		}

		public static var count: Int {
			get { return Int(SDL_GetCPUCount()) }
		}

		public static var systemRAM: Int {
			get { return Int(SDL_GetSystemRAM()) }
		}

		public static var has3DNow: Bool { get { return SDL_Has3DNow().boolValue } }
		public static var hasAVX: Bool { get { return SDL_HasAVX().boolValue } }
		public static var hasAVX2: Bool { get { return SDL_HasAVX2().boolValue } }
		public static var hasAltiVec: Bool { get { return SDL_HasAltiVec().boolValue } }
		public static var hasMMX: Bool { get { return SDL_HasMMX().boolValue } }
		public static var hasRDTSC: Bool { get { return SDL_HasRDTSC().boolValue } }
		public static var hasSSE: Bool { get { return SDL_HasSSE().boolValue } }
		public static var hasSSE2: Bool { get { return SDL_HasSSE2().boolValue } }
		public static var hasSSE3: Bool { get { return SDL_HasSSE3().boolValue } }
		public static var hasSSE41: Bool { get { return SDL_HasSSE41().boolValue } }
		public static var hasSSE42: Bool { get { return SDL_HasSSE42().boolValue } }
	}
}
