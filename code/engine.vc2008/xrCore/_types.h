#pragma once
#include <cstdint>
#include <limits>
#include <atomic>
// Type defs
using s8 = std::int8_t;
using u8 = std::uint8_t;

using s16 = std::int16_t;
using u16 = std::uint16_t;

using s32 = std::int32_t;
using u32 = std::uint32_t;

using s64 = std::int64_t;
using u64 = std::uint64_t;

using f32 = float;
using f64 = double;

using pstr = char*;
using pcstr = const char*;

#	undef max
#	undef min

// Type limits
template <typename T>
constexpr auto type_max = std::numeric_limits<T>::max();

template <typename T>
constexpr auto type_min = -std::numeric_limits<T>::max();

template <typename T>
constexpr auto type_zero = std::numeric_limits<T>::min();

template <typename T>
constexpr auto type_epsilon = std::numeric_limits<T>::epsilon();

constexpr int int_max  = type_max<int>;
constexpr int int_min  = type_min<int>;
constexpr int int_zero = type_zero<int>;

constexpr float flt_max  = type_max<float>;
constexpr float flt_min  = type_min<float>;
constexpr float flt_zero = type_zero<float>;
constexpr float flt_eps  = type_epsilon<float>;

#undef FLT_MAX
#undef FLT_MIN
#define FLT_MAX flt_max
#define FLT_MIN flt_min

constexpr double dbl_max = type_max<double>;
constexpr double dbl_min = type_min<double>;
constexpr double dbl_zero = type_zero<double>;
constexpr double dbl_eps = type_epsilon<double>;
constexpr int max_path = 260;
using string16    = char[16];
using string32    = char[32];
using string64    = char[64];
using string128   = char[128];
using string256   = char[256];
using string512   = char[512];
using string1024  = char[1024];
using string2048  = char[2048];
using string4096  = char[4096];
using string_path = char[2 * max_path];

using wstring16    = wchar_t[16];
using wstring32    = wchar_t[32];
using wstring64    = wchar_t[64];
using wstring128   = wchar_t[128];
using wstring256   = wchar_t[256];
using wstring512   = wchar_t[512];
using wstring1024  = wchar_t[1024];
using wstring2048  = wchar_t[2048];
using wstring4096  = wchar_t[4096];
using wstring_path = wchar_t[2 * max_path];


using xr_atomic_u8  = std::atomic<u8>;
using xr_atomic_u16 = std::atomic<u16>;
using xr_atomic_u32 = std::atomic<u32>;
using xr_atomic_u64 = std::atomic<u64>;

using xr_atomic_s8  = std::atomic<s8>;
using xr_atomic_s16 = std::atomic<s16>;
using xr_atomic_s32 = std::atomic<s32>;
using xr_atomic_s64 = std::atomic<s64>;
