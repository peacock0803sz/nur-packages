{ lib, buildGo125Module, fetchFromGitHub }:
let
  version = "0.3.0";
in
buildGo125Module {
  pname = "notizen";
  inherit version;

  src = fetchFromGitHub {
    owner = "peacock0803sz";
    repo = "notizen";
    tag = "v${version}";
    hash = "sha256-7isN40lC6VE1s3+bMnDI6+qjHQz3IssLzwlGgOHls7Q=";
  };

  vendorHash = "sha256-n58Qmiv3gik1qkuXQFbQ+soeOQtUz1dUocEAJepqp/E=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/peacock0803sz/notizen/cmd/notizen/main.version=v${version}"
  ];
  doCheck = false;

  meta = {
    description = "A simple note-taking CLI";
    homepage = "https://github.com/peacock0803sz/notizen";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
    mainProgram = "notizen";
  };
}
