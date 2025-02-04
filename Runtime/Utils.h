#pragma once
#include "Shlwapi.h"
#include <utility>
#include <wrl.h>
#include <EffectUtils.h>

using namespace Microsoft::WRL;


class Utils {
public:
	static UINT GetWindowShowCmd(HWND hwnd) {
		assert(hwnd != NULL);

		WINDOWPLACEMENT wp{};
		wp.length = sizeof(wp);
		Debug::ThrowIfWin32Failed(
			GetWindowPlacement(hwnd, &wp),
			L"GetWindowPlacement失败"
		);

		return wp.showCmd;
	}

	static void GetClientScreenRect(HWND hWnd, RECT& rect) {
		RECT r;
		Debug::ThrowIfWin32Failed(
			GetClientRect(hWnd, &r),
			L"GetClientRect 失败"
		);

		POINT p{};
		Debug::ThrowIfWin32Failed(
			ClientToScreen(hWnd, &p),
			L"ClientToScreen 失败"
		);

		rect.bottom = r.bottom + p.y;
		rect.left = r.left + p.x;
		rect.right = r.right + p.x;
		rect.top = r.top + p.y;
	}

	static RECT GetScreenRect(HWND hWnd) {
		HMONITOR hMonitor = MonitorFromWindow(hWnd, MONITOR_DEFAULTTONEAREST);

		MONITORINFO mi{};
		mi.cbSize = sizeof(mi);
		Debug::ThrowIfWin32Failed(
			GetMonitorInfo(hMonitor, &mi),
			L"获取显示器信息失败"
		);
		return mi.rcMonitor;
	}

	static SIZE GetSize(const RECT& rect) {
		return { rect.right - rect.left, rect.bottom - rect.top };
	}

	static D2D1_SIZE_F GetSize(const D2D1_RECT_F& rect) {
		return { rect.right - rect.left,rect.bottom - rect.top };
	}

	static BOOL Str2GUID(const std::wstring_view &szGUID, GUID& guid) {
		if (szGUID.size() != 36) {
			return FALSE;
		}

		return swscanf_s(szGUID.data(),
			L"%08lx-%04hx-%04hx-%02hhx%02hhx-%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx",
			&guid.Data1,
			&guid.Data2,
			&guid.Data3,
			&guid.Data4[0], &guid.Data4[1],
			&guid.Data4[2], &guid.Data4[3], &guid.Data4[4], &guid.Data4[5], &guid.Data4[6], &guid.Data4[7]
		) == 11;
	}


	static std::string GUID2Str(GUID guid) {
		char buf[65]{};

		sprintf_s(buf, "%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X",
			guid.Data1,
			guid.Data2,
			guid.Data3,
			guid.Data4[0], guid.Data4[1],
			guid.Data4[2], guid.Data4[3], guid.Data4[4], guid.Data4[5], guid.Data4[6], guid.Data4[7]
		);
		return { buf };
	}

	static void SaveD2DImage(
		ComPtr<ID2D1Device> d2dDevice,
		ComPtr<ID2D1Image> img,
		const std::wstring_view& fileName
	) {
		ComPtr<IWICImagingFactory2> wicImgFactory;

		Debug::ThrowIfComFailed(
			CoCreateInstance(
				CLSID_WICImagingFactory,
				nullptr,
				CLSCTX_INPROC_SERVER,
				IID_PPV_ARGS(&wicImgFactory)
			),
			L"创建 IWICImagingFactory2 失败"
		);

		ComPtr<IStream> stream;
		Debug::ThrowIfComFailed(
			SHCreateStreamOnFileEx(fileName.data(), STGM_WRITE | STGM_CREATE, 0, TRUE, nullptr, &stream),
			L"SHCreateStreamOnFileEx 失败"
		);

		ComPtr<IWICBitmapEncoder> bmpEncoder;
		Debug::ThrowIfComFailed(
			wicImgFactory->CreateEncoder(GUID_ContainerFormatPng, nullptr, &bmpEncoder),
			L"创建 IWICBitmapEncoder 失败"
		);
		Debug::ThrowIfComFailed(
			bmpEncoder->Initialize(stream.Get(), WICBitmapEncoderNoCache),
			L"IWICBitmapEncoder 初始化失败"
		);

		ComPtr<IWICBitmapFrameEncode> frameEncoder;
		Debug::ThrowIfComFailed(
			bmpEncoder->CreateNewFrame(&frameEncoder, nullptr),
			L"创建 IWICBitmapFrameEncode 失败"
		);
		Debug::ThrowIfComFailed(
			frameEncoder->Initialize(nullptr),
			L"IWICBitmapFrameEncode 初始化失败"
		);

		ComPtr<IWICImageEncoder> d2dImgEncoder;
		Debug::ThrowIfComFailed(
			wicImgFactory->CreateImageEncoder(d2dDevice.Get(), &d2dImgEncoder),
			L"创建 IWICImageEncoder 失败"
		);
		Debug::ThrowIfComFailed(
			d2dImgEncoder->WriteFrame(img.Get(), frameEncoder.Get(), nullptr),
			L"IWICImageEncoder.WriteFrame失败"
		);
		
		Debug::ThrowIfComFailed(frameEncoder->Commit(), L"IWICBitmapFrameEncode.Commit 失败");
		Debug::ThrowIfComFailed(bmpEncoder->Commit(), L"IWICBitmapEncoder.Commit 失败");
		Debug::ThrowIfComFailed(stream->Commit(STGC_DEFAULT), L"IStream.Commit 失败");
	}

	static HRESULT UTF8ToUTF16(std::string_view str, std::wstring& result) {
		return EffectUtils::UTF8ToUTF16(str, result);
	}
};

namespace std {
	// std::hash 的 GUID 特化
	template<>
	struct hash<GUID> {
		size_t operator()(const GUID& value) const {
			size_t result = hash<unsigned long>()(value.Data1);
			result ^= hash<unsigned short>()(value.Data2) << 1;
			result ^= hash<unsigned short>()(value.Data3) << 2;
			
			for (int i = 0; i < 8; ++i) {
				result ^= hash<unsigned short>()(value.Data4[i]) << i;
			}

			return result;
		}
	};
}
