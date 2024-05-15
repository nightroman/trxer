param(
	$Configuration = 'Release'
)

Set-StrictMode -Version 3

task build {
	exec { dotnet build TrxerConsole\TrxerConsole.csproj -c $Configuration }
}

task clean {
	remove *\bin, *\obj
}

task publish build, {
	requires -Path $env:scoop
	Copy-Item TrxerConsole\bin\$Configuration\TrxerConsole.exe $env:scoop\shims\TrxerConsole.exe
}

task . publish, clean
