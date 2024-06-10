# CMakeList.txt: HttpWebSocketServer 的 CMake 專案，在此包含來源及定義
# 專案專屬邏輯。
#
cmake_minimum_required (VERSION 3.8)

# 如果支援，則為 MSVC 編譯器啟用熱重新載入。
if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

project ("HttpWebSocketServer")

set(BOOST_ROOT "D:/boost_1_85_0")
set(Boost_USE_STATIC_LIBS OFF "main.cpp") 
set(Boost_USE_MULTITHREADED ON)  
set(Boost_USE_STATIC_RUNTIME OFF) 
find_package(Boost REQUIRED COMPONENTS system) # header only libraries must not be added here

# 將來源新增到此專案的可執行檔。
add_executable (HttpWebSocketServer "main.cpp")

if (CMAKE_VERSION VERSION_GREATER 3.12)
  set_property(TARGET HttpWebSocketServer PROPERTY CXX_STANDARD 20)
endif()

target_include_directories(HttpWebSocketServer PUBLIC ${Boost_INCLUDE_DIRS}) 
target_link_libraries(HttpWebSocketServer ${Boost_LIBRARIES})