import SDL2

public typealias AudioCallback<C> = (C, UnsafeMutablePointer<UInt8>, Int) -> ()
public typealias AudioCallbackFoo<C,T> = (C, UnsafeMutableBufferPointer<T>) -> ()

public typealias TimerCallback = (Int) -> (Int)
public typealias TimerID = SDL_TimerID
public typealias Event = SDL_Event
public typealias EventType = SDL_EventType
public typealias EventFilterCallback = (inout Event) -> Bool
public typealias EventWatchCallback = (inout Event) -> ()
public typealias TouchID = SDL_TouchID
public typealias SystemCursor = SDL_SystemCursor
public typealias Keycode = SDL_Keycode
public typealias Scancode = SDL_Scancode
public typealias GLContext = SDL_GLContext
public typealias GLattr = SDL_GLattr

public typealias AudioStatus = SDL_AudioStatus
//public typealias AudioFormat = SDL_AudioFormat
public typealias AudioSpect = SDL_AudioSpec

public typealias XXPixelFormat = UInt32

