import SDL2

public extension sdl {
	public struct platform {
		private init() {}
		public static var name: String {
			get { return String(cString: SDL_GetPlatform()) }
		}
	}
}
