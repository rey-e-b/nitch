import
  std/osproc

proc getDpkgPkgs*(): string =
  let
    output = osproc.execCmd("dpkg-query -W -f='${binary:Package}\n'")
    packages = output.split("\n").filterIt(it.len > 0) # remove empty lines
  result = $(packages.len)

