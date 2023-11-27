param ($javaVersion, $perm)

switch ($javaVersion) {
	"Java 11" { $env:JAVA_HOME = "C:\Program Files\OpenJDK\jdk-11.0.18.10-hotspot" }
	"Java 17" { $env:JAVA_HOME = "C:\Program Files\OpenJDK\jdk-17.0.2" }
	"Java 21" { $env:JAVA_HOME = "C:\Program Files\Java\jdk-21" }
}

if ($perm -eq "perm") {
  [Environment]::SetEnvironmentVariable("JAVA_HOME", $env:JAVA_HOME, [System.EnvironmentVariableTarget]::Machine)
}

$env:Path = $env:JAVA_HOME + '\bin;' + $env:Path

Write-Output "$javaVersion activated."
