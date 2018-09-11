import SDL2

public struct Clipboard {
	private init() {}
	public static func hasText() -> Bool {
		return SDL_HasClipboardText() == .TRUE
	}

	public static func getText() -> String? {
		return String(cString: SDL_GetClipboardText())
	}

	public static func setText(text: String) {
		SDL_SetClipboardText(text)
	}
}
