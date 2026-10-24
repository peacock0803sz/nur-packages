{ lib, buildGo126Module, fetchFromGitHub }:
let
  version = "0.3.4";
in
buildGo126Module {
  pname = "langsmith-cli";
  inherit version;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langsmith-cli";
    tag = "v${version}";
    hash = "sha256-/EMta/OpisQH4IKMYyvL7xzFGVw3ZNpSXGMrWwjiJv8=";
  };

  vendorHash = "sha256-sNiVCnWmdKtJ3xIa5NtL3ZWGKwKidAVP252z/8REKHY=";

  subPackages = [ "cmd/langsmith" ];

  ldflags = [
    "-s"
    "-w"
    "-X=main.version=v${version}"
  ];
  doCheck = false;

  meta = {
    description = "A coding agent-first CLI for interacting with LangSmith";
    homepage = "https://github.com/langchain-ai/langsmith-cli";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
    mainProgram = "langsmith";
  };
}
