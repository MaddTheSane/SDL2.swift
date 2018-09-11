import SDL2

public extension sdl {
	public struct fs {
		private init() {}
		public static var basePath: String {
			get { return String(cString: SDL_GetBasePath()) }
		}

		public static func preferencesPathForApplication(name app: String, organization org: String) -> String {
			return String(cString: SDL_GetPrefPath(org, app))
		}
	}
}
