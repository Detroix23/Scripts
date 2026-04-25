<#
	Setup a Python project.

	Arguments:
	1. `name`. 
#>
param(
	[Parameter(Mandatory=$true)]
	[string]$name
);

$code_user = "detroix23";
$directory = $(Get-Location);

# Construction
New-Item -Path $directory -Name $name -ItemType "Directory";
$project = "${directory}`\${name}";
$body_main = "`"`"`"
# ${name}.
/src/${name}_${code_user}/__main__.py
`"`"`"

def main() -> None:
	`"`"`"
	Main entry point.
	`"`"`"
	...

main()
";

$body_init = "`"`"`"
# ${name}.
/src/${name}_${code_user}/__init__.py
`"`"`"
";

Copy-Item -Path "${HOME}/.scripts/pyproject_model/*" -Destination "${project}" -Recurse;

New-Item -Path "${project}/src" -Name "${name}_${code_user}" -ItemType "Directory";

New-Item -Path "${project}/src/${name}_${code_user}" -Name "__main__.py" -ItemType "File" -Value $body_main;

New-Item -Path "${project}/src/${name}_${code_user}" -Name "__init__.py" -ItemType "File" -Value $body_init;

git -C $project init;

Write-Output "Initialized virtual environment `.venv`."
py -m venv "${project}/.venv";

Write-Output "Pyproject setup in ${project}."

