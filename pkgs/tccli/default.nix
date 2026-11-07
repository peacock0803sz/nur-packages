{ lib, python3Packages, fetchFromGitHub }:
let
  version = "3.1.198.1";
  # Not in nixpkgs; kept private to tccli and bumped by hand.
  cos-python-sdk-v5 = python3Packages.callPackage ./cos-python-sdk-v5.nix { };
in
python3Packages.buildPythonApplication {
  pname = "tccli";
  inherit version;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "TencentCloud";
    repo = "tencentcloud-cli";
    tag = version;
    hash = "sha256-IKkcbK+4lS+1eJgK9i02azrZRcy5HlItw200a4NgaFU=";
  };

  build-system = [ python3Packages.hatchling ];

  dependencies = (with python3Packages; [
    jmespath
    six
    tencentcloud-sdk-python
  ]) ++ [ cos-python-sdk-v5 ];

  # tccli often requires a newer SDK than nixpkgs ships yet.
  pythonRelaxDeps = [ "tencentcloud-sdk-python" ];

  doCheck = false;
  pythonImportsCheck = [ "tccli" ];

  meta = {
    description = "Tencent Cloud API 3.0 Command Line Interface";
    homepage = "https://github.com/TencentCloud/tencentcloud-cli";
    license = lib.licenses.asl20;
    platforms = lib.platforms.all;
    mainProgram = "tccli";
  };
}
