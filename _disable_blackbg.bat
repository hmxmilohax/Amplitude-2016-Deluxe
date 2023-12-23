FOR /R "%~dp0_ark\ps3\world" %%f in (*) do DEL %%f
rd "%~dp0_ark\ps3\world\world_01"
rd "%~dp0_ark\ps3\world\world_02"
rd "%~dp0_ark\ps3\world\world_03"
rd "%~dp0_ark\ps3\world\shared\fx"
rd "%~dp0_ark\ps3\world\shared\geo"
rd "%~dp0_ark\ps3\world\shared\shaders"
rd "%~dp0_ark\ps3\world\shared"
rd "%~dp0_ark\ps3\world"
xcopy /e /y "%~dp0dx_optional_additions\_revert_to_default\ps3blkbg" "%~dp0_build\prep\ps3\ps3\world
FOR /R "%~dp0_ark\ps4\world" %%f in (*) do DEL %%f
rd "%~dp0_ark\ps4\world\world_01"
rd "%~dp0_ark\ps4\world\world_02"
rd "%~dp0_ark\ps4\world\world_03"
rd "%~dp0_ark\ps4\world\shared\fx"
rd "%~dp0_ark\ps4\world\shared\geo"
rd "%~dp0_ark\ps4\world\shared\shaders"
rd "%~dp0_ark\ps4\world\shared"
rd "%~dp0_ark\ps4\world"
xcopy /e /y "%~dp0dx_optional_additions\_revert_to_default\ps4blkbg" "%~dp0_build\prep\ps4\ps4\world
pause