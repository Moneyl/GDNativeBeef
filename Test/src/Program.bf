using System.Diagnostics;
using GDNative;
using System;

namespace GDNativeBeefTest
{
	//Windows OS APIs. Only here for testing purposes until a visual indication of the plugin is in godot
	public static class WinAPI
	{
		[Import("user32.dll"), CLink, CallingConvention(.Stdcall)]
		public static extern System.Interop.c_int MessageBoxA(void* hWnd, System.Interop.c_char* lpText, System.Interop.c_char* lpCaption, System.Interop.c_uint uType);
	}

	public static class Program
	{
		[Export, LinkName(.C)]
		public static GDNativeBool GDNativeInit(GDNative.Interface* gdInterface, GDNative.ExtensionClassLibraryPtr library, GDNative.Initialization* init)
		{
			init.MinimumInitializationLevel = .Scene;
			init.Initialize = => Initialize;
			init.Deinitialize = => Deinitialize;
			init.Userdata = gdInterface;
			return GDTrue;
		}

		public static void Initialize(void* userdata, InitializationLevel level)
		{
			//String message = scope $"Loaded extension DLL! GDVersion info: {gdInterface.VersionMajor}.{gdInterface.VersionMinor}.{gdInterface.VersionPatch} | {gdInterface.VersionString}";
			WinAPI.MessageBoxA(null, "Test2 box222!", "Test", 0);
			static char8* a = "TEST TEST TEST TEST *************************************";
			GDNative.Interface* gdInterface = (Interface*)userdata;
			gdInterface.PrintWarning(a, "GDNativeInit", "Program.bf", 0);
		}

		public static void Deinitialize(void* userdata, InitializationLevel level)
		{

		}
	}
}