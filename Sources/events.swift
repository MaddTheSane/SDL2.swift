import SDL2

// TODO: review filtering/watching for thread safety
// TODO: SDL_RecordGesture
// TODO: dollar templates

public class WatchID {
	init(_ callback: @escaping EventWatchCallback) {
		cb = callback
	}
	let cb: EventWatchCallback
}

public enum SDLEvent {
	/// Unknown, possibly new event type
	case unknown(SDL_Event)
	/// Window event data
	case display(SDL_DisplayEvent)
	/// Window event data
	case window(SDL_WindowEvent)
	/// Keyboard event data
	case key(SDL_KeyboardEvent)
	/// Text editing event data
	case textEdit(SDL_TextEditingEvent)
	/// Text input event data
	case textInput(SDL_TextInputEvent)
	/// Mouse motion event data
	case mouseMotion(SDL_MouseMotionEvent)
	/// Mouse button event data
	case mouseButton(SDL_MouseButtonEvent)
	/// Mouse wheel event data
	case mouseWheel(SDL_MouseWheelEvent)
	/// Joystick axis event data
	case joystickAxis(SDL_JoyAxisEvent)
	/// Joystick ball event data
	case joystickBall(SDL_JoyBallEvent)
	/// Joystick hat event data
	case joystickHat(SDL_JoyHatEvent)
	/// Joystick button event data
	case joystickButton(SDL_JoyButtonEvent)
	/// Joystick device change event data
	case joystickDevice(SDL_JoyDeviceEvent)
	/// Game Controller axis event data
	case controllerAxis(SDL_ControllerAxisEvent)
	/// Game Controller button event data
	case controllerButton(SDL_ControllerButtonEvent)
	/// Game Controller device event data
	case controllerDevice(SDL_ControllerDeviceEvent)
	/// Audio device event data
	case audioDevice(SDL_AudioDeviceEvent)
	/// Sensor event data
	case sensor(SDL_SensorEvent)
	/// Quit request event data
	case quit(SDL_QuitEvent)
	/// Custom event data
	case user(SDL_UserEvent)
	/// System dependent window event data
	case sysemWindow(SDL_SysWMEvent)
	/// Touch finger event data
	case touchFinger(SDL_TouchFingerEvent)
	/// Gesture event data
	case multiGesture(SDL_MultiGestureEvent)
	/// Gesture event data
	case dollarGesture(SDL_DollarGestureEvent)
	/// Drag and drop event data
	case drop(SDL_DropEvent)
	/// The application is being terminated by the OS
	case terminating
	/// The application is low on memory, free memory if possible.
	case lowMemory
	/// The application is about to enter the background
	case willEnterBackground
	/// The application did enter the background and may not get CPU for some time
	case didEnterBackground
	/// The application is about to enter the foreground
	case willEnterForeground
	/// The application is now interactive
	case didEnterForeground
	/// Keymap changed due to a system event such as an
	/// input language or keyboard layout change.
	case keymapChanged
	/// The clipboard changed
	case clipboardUpdate
	/// The render targets have been reset and their contents need to be updated
	case renderTargetsReset
	/// The device has been reset and all textures need to be recreated
	case renderDeviceReset
	
	public var eventType: SDL_EventType {
		switch self {
		case .unknown(let evt):
			return evt.type
		case .display(let evt):
			return evt.type
		case .window(let evt):
			return evt.type
		case .key(let evt):
			return evt.type
		case .textEdit(let evt):
			return evt.type
		case .textInput(let evt):
			return evt.type
		case .mouseMotion(let evt):
			return evt.type
		case .mouseWheel(let evt):
			return evt.type
		case .mouseButton(let evt):
			return evt.type
		case .joystickHat(let evt):
			return evt.type
		case .joystickAxis(let evt):
			return evt.type
		case .joystickBall(let evt):
			return evt.type
		case .joystickButton(let evt):
			return evt.type
		case .joystickDevice(let evt):
			return evt.type
		case .controllerDevice(let evt):
			return evt.type
		case .controllerAxis(let evt):
			return evt.type
		case .controllerButton(let evt):
			return evt.type
		case .audioDevice(let evt):
			return evt.type
		case .sensor(let evt):
			return evt.type
		case .sysemWindow(let evt):
			return evt.type
		case .touchFinger(let evt):
			return evt.type
		case .multiGesture(let evt):
			return evt.type
		case .dollarGesture(let evt):
			return evt.type
		case .drop(let evt):
			return evt.type
		case .quit(let evt):
			return evt.type
		case .user(let evt):
			return evt.type
		case .terminating:
			return .APP_TERMINATING
		case .lowMemory:
			return .APP_LOWMEMORY
		case .willEnterBackground:
			return .APP_WILLENTERBACKGROUND
		case .didEnterBackground:
			return .APP_DIDENTERBACKGROUND
		case .willEnterForeground:
			return .APP_WILLENTERFOREGROUND
		case .didEnterForeground:
			return .APP_DIDENTERFOREGROUND
		case .keymapChanged:
			return .KEYMAPCHANGED
		case .clipboardUpdate:
			return .CLIPBOARDUPDATE
		case .renderDeviceReset:
			return .RENDER_DEVICE_RESET
		case .renderTargetsReset:
			return .RENDER_TARGETS_RESET
		}
	}
}

extension SDLEvent {
	/// Creates an SDLEvent enum from an SDL_Event union.
	public init(event: SDL_Event) {
		switch event.type {
		case .DISPLAYEVENT:
			self = .display(event.display)
			
		case .WINDOWEVENT:
			self = .window(event.window)
			
		case .SYSWMEVENT:
			self = .sysemWindow(event.syswm)
			
		case .KEYUP, .KEYDOWN:
			self = .key(event.key)
			
		case .TEXTEDITING:
			self = .textEdit(event.edit)
			
		case .TEXTINPUT:
			self = .textInput(event.text)
			
		case .MOUSEMOTION:
			self = .mouseMotion(event.motion)
			
		case .MOUSEBUTTONUP, .MOUSEBUTTONDOWN:
			self = .mouseButton(event.button)
			
		case .MOUSEWHEEL:
			self = .mouseWheel(event.wheel)
			
		case .JOYAXISMOTION:
			self = .joystickAxis(event.jaxis)
			
		case .JOYBUTTONUP, .JOYBUTTONDOWN:
			self = .joystickButton(event.jbutton)
			
		case .JOYHATMOTION:
			self = .joystickHat(event.jhat)
			
		case .JOYBALLMOTION:
			self = .joystickBall(event.jball)
			
		case .JOYDEVICEADDED, .JOYDEVICEREMOVED:
			self = .joystickDevice(event.jdevice)
			
		case .CONTROLLERBUTTONUP, .CONTROLLERBUTTONDOWN:
			self = .controllerButton(event.cbutton)
			
		case .CONTROLLERAXISMOTION:
			self = .controllerAxis(event.caxis)
			
		case .CONTROLLERDEVICEADDED, .CONTROLLERDEVICEREMOVED, .CONTROLLERDEVICEREMAPPED:
			self = .controllerDevice(event.cdevice)
			
		case .FINGERUP, .FINGERDOWN, .FINGERMOTION:
			self = .touchFinger(event.tfinger)
			
		case .MULTIGESTURE:
			self = .multiGesture(event.mgesture)
			
		case .DOLLARGESTURE, .DOLLARRECORD:
			self = .dollarGesture(event.dgesture)
			
		case .DROPBEGIN, .DROPFILE, .DROPTEXT, .DROPCOMPLETE:
			self = .drop(event.drop)
			
		case .AUDIODEVICEADDED, .AUDIODEVICEREMOVED:
			self = .audioDevice(event.adevice)
			
		case .SENSORUPDATE:
			self = .sensor(event.sensor)
			
		case .RENDER_DEVICE_RESET:
			self = .renderDeviceReset
		
		case .RENDER_TARGETS_RESET:
			self = .renderTargetsReset
			
		case .QUIT:
			self = .quit(event.quit)
			
		case .USEREVENT:
			self = .user(event.user)
			
		case .APP_TERMINATING:
			self = .terminating
			
		case .APP_LOWMEMORY:
			self = .lowMemory
			
		case .APP_DIDENTERBACKGROUND:
			self = .didEnterBackground
			
		case .APP_WILLENTERBACKGROUND:
			self = .willEnterBackground
			
		case .APP_WILLENTERFOREGROUND:
			self = .willEnterForeground
			
		case .APP_DIDENTERFOREGROUND:
			self = .didEnterForeground
			
		case .KEYMAPCHANGED:
			self = .keymapChanged
			
		case .CLIPBOARDUPDATE:
			self = .clipboardUpdate
			
		default:
			if (SDL_EventType.USEREVENT.rawValue ... SDL_EventType.LASTEVENT.rawValue).contains(event.type.rawValue) {
				self = .user(event.user)
			} else {
				self = .unknown(event)
			}
		}
	}
}

public struct Events {
	private init() {}

	public static func isEventTypeEnabled(type: SDL_EventType) -> Bool {
		return SDL_EventState(type, -1) == 1
	}

	public static func setEventTypeEnabled(type: SDL_EventType, _ enabled: Bool) {
		SDL_EventState(type, enabled ? SDL_ENABLE : SDL_DISABLE)
	}

	public static func registerEvents(count: Int) -> UInt32 {
		return SDL_RegisterEvents(Int32(count))
	}

	public static func pump() {
		SDL_PumpEvents()
	}

	public static func push(evt: inout Event) {
		SDL_PushEvent(&evt)
	}

	public static func poll() -> Event? {
		var evt = Event()
		if poll(&evt) {
			return evt
		} else {
			return nil
		}
	}

	public static func poll(_ evt: inout Event) -> Bool {
		return SDL_PollEvent(&evt) == Int32(1)
	}

	public static func wait() -> Event {
		var evt = Event()
		wait(evt: &evt)
		return evt
	}

	public static func wait(timeout: Int) -> Event? {
		var evt = Event()
		if wait(evt: &evt, timeout: timeout) {
			return evt
		} else {
			return nil
		}
	}

	public static func wait(evt: inout Event) {
		SDL_WaitEvent(&evt)
	}

	public static func wait(evt: inout Event, timeout: Int) -> Bool {
		return SDL_WaitEventTimeout(&evt, Int32(timeout)) == 1
	}

	public static func flush(type: SDL_EventType) {
		SDL_FlushEvent(type)
	}

	public static func flush(type: UInt32) {
		SDL_FlushEvent(SDL_EventType(rawValue: SDL_EventType.RawValue(type))!)
	}

	public static func flush(minType min: SDL_EventType, maxType max: SDL_EventType) {
		SDL_FlushEvents(min, max)
	}	

	public static func flush(minType min: UInt32, maxType max: UInt32) {
		SDL_FlushEvents(SDL_EventType(rawValue: SDL_EventType.RawValue(min))!, SDL_EventType(rawValue: SDL_EventType.RawValue(max))!)
	}

	public static func add(events: inout [Event], count: Int = -1) {
		let c = (count == -1) ? events.count : count
		SDL_PeepEvents(&events, Int32(c), .add, .FIRSTEVENT, .LASTEVENT)
	}

	public static func get(events: inout [Event], count: Int = -1, minType: SDL_EventType = .FIRSTEVENT, maxType: SDL_EventType = .LASTEVENT) {
		let c = (count == -1) ? events.count : count
		SDL_PeepEvents(&events, Int32(c), .get, .FIRSTEVENT, .LASTEVENT)
	}

	public static func peek(events: inout [Event], count: Int = -1, minType: SDL_EventType = .FIRSTEVENT, maxType: SDL_EventType = .LASTEVENT) {
		let c = (count == -1) ? events.count : count
		SDL_PeepEvents(&events, Int32(c), .peek, minType, maxType)
	}

	public static func hasEvent(type: SDL_EventType) -> Bool {
		return SDL_HasEvent(type).boolValue
	}

	public static func hasEvent(type: UInt32) -> Bool {
		return SDL_HasEvent(SDL_EventType(rawValue: SDL_EventType.RawValue(type))!).boolValue
	}

	public static func hasEvents(minType: SDL_EventType, maxType: SDL_EventType) -> Bool {
		return SDL_HasEvents(minType, maxType).boolValue
	}

	public static func hasEvents(minType: UInt32, maxType: UInt32) -> Bool {
		return SDL_HasEvents(SDL_EventType(rawValue: SDL_EventType.RawValue(minType))!, SDL_EventType(rawValue: SDL_EventType.RawValue(maxType))!).boolValue
	}

	//public class func qUItRequested() {
	//	return SDL_QUItRequested()
	//}

	public static var numberOfTouchDevices: Int {
		return Int(SDL_GetNumTouchDevices()) 
	}

	public static func getTouchDevice(index: Int) -> TouchDevice {
		return TouchDevice(deviceID: SDL_GetTouchDevice(Int32(index)))
	}

	//
	// Filtering

	public static func filter(callback: EventFilterCallback) {
		// FIXME
		// let box = Box(callback)
		// let opq = Unmanaged.passRetained(box).toOpaque()
		// let mut = UnsafeMutableRawPointer(opq)
		// SDL_FilterEvents({ (userdata,evt) in
		// 	let opq = OpaquePointer(userdata)
		// 	let box: Box<EventFilterCallback> = Unmanaged
		// 											.fromOpaque(opq)
		// 											.takeRetainedValue()
		// 	return box.value(&evt.pointee) ? 1 : 0
		// }, mut)
	}

	public static func getFilter() -> EventFilterCallback? {
		return activeFilter?.value
	}

	public static func setFilter(callback: EventFilterCallback?) {
		// FIXME
		// clearFilter()
		// if (callback != nil) {
		// 	activeFilter = Box(callback!)
		// 	let opq = Unmanaged.passUnretained(activeFilter!).toOpaque()
		// 	let mut = UnsafeMutableRawPointer(opq)
		// 	SDL_SetEventFilter({ (userdata,evt) in
		// 		let opq = OpaquePointer(userdata)
		// 		let box: Box<EventFilterCallback> = Unmanaged
		// 												.fromOpaque(opq)
		// 												.takeUnretainedValue()
		// 		return box.value(&evt.pointee) ? 1 : 0
		// 	}, mut)
		// }
	}

	public static func clearFilter() {
		SDL_SetEventFilter(nil, nil)
		activeFilter = nil
	}

	private static var activeFilter: Box<EventFilterCallback>?

	//
	// Watching

	// FIXME
	// public static func addWatch(callback: EventWatchCallback) -> WatchID {
	// 	let watchId = WatchID(callback)
	// 	watches.append(watchId)
	// 	if watches.count == 1 {
	// 		SDL_AddEventWatch({ (userdata,evt) in
	// 			for watch in Events.watches {
	// 				watch.cb(&evt.pointee)
	// 			}
	// 			return 0
	// 		}, nil)
	// 	}
	// 	return watchId
	// }

	public static func deleteWatch(id: WatchID) {
		let ix = watches.index(where: {$0 === id})
		if ix != nil {
			watches.remove(at: ix!)
		}
	}

	private static var watches: [WatchID] = []
	
}

public extension Event {
	// NOTE: this should be safe, structs are all laid out identically
	public var timestamp: UInt32 { return self.common.timestamp  }
	public var windowID: UInt32 { return self.motion.windowID  }

	//
	// App

	public var isQuit: Bool {
		return self.type == .QUIT
	}

	//
	// Window

	public var isWindow: Bool {
		return self.type == .WINDOWEVENT
	}

	public var isWindowClose: Bool {
		return self.window.event == .close
	}

	// Keyboard

	public var isKeyDown: Bool {
		return self.type == .KEYDOWN
	}

	public var isKeyUp: Bool {
		return self.type == .KEYUP
	}

	public var isTextEditing: Bool {
		return self.type == .TEXTEDITING
	}

	public var isTextInput: Bool {
		return self.type == .TEXTINPUT
	}

	//public var isKeyMapChanged: Bool {
	//	return self.type == SDL_KEYMAPCHANGED.rawValue 
	//}

	// Mouse
	// TODO: "state" member

	public var isMouseMotion: Bool {
		return self.type == .MOUSEMOTION
	}

	public var mouseMotionWhich: UInt32 { return self.motion.which  }
	public var mouseMotionX: Int { return Int(self.motion.x)  }
	public var mouseMotionY: Int { return Int(self.motion.y)  }
	public var mouseMotionDX: Int { return Int(self.motion.xrel)  }
	public var mouseMotionDY: Int { return Int(self.motion.yrel)  }
	
	public var isMouseButtonDown: Bool {
		return self.type == .MOUSEBUTTONDOWN
	}

	public var isMouseButtonUp: Bool {
		return self.type == .MOUSEBUTTONUP
	}

	public var isLeftMouseButton: Bool {
		return self.button.button == UInt8(SDL_BUTTON_LEFT) 
	}

	public var isMiddleMouseButton: Bool {
		return self.button.button == UInt8(SDL_BUTTON_MIDDLE) 
	}

	public var isRightMouseButton: Bool {
		return self.button.button == UInt8(SDL_BUTTON_RIGHT) 
	}

	public var isX1MouseButton: Bool {
		return self.button.button == UInt8(SDL_BUTTON_X1) 
	}

	public var isX2MouseButton: Bool {
		return self.button.button == UInt8(SDL_BUTTON_X2) 
	}

	public var mouseButtonWhich: UInt32 { return self.button.which  }

	// TODO: replace this with an internal constant
	public var mouseButtonButton: Int { return Int(self.button.button)  }
	public var mouseButtonX: Int { return Int(self.button.x)  }
	public var mouseButtonY: Int { return Int(self.button.y)  }
	public var mouseButtonClicks: Int { return Int(self.button.clicks)  }

	public var isMouseWheel: Bool {
		return self.type == .MOUSEWHEEL 
	}

	public var mouseWheelWhich: UInt32 { return self.wheel.which  }
	public var mouseWheelDX: Int { return Int(self.wheel.x)  }
	public var mouseWheelDY: Int { return Int(self.wheel.y)  }
	
	// TODO: "direction" member (constantify)
	// public var mouseWheelIsFlipped: Bool { return self.wheel.direction == SDL_MOUSEWHEEL_FLIPPED  }
}
