{ lib, buildGo126Module, fetchFromGitHub }:
let
  version = "0.2.60";
in
buildGo126Module {
  pname = "langsmith-cli";
  inherit version;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langsmith-cli";
    tag = "v${version}";
    hash = "sha256-mRK/Lo90iFE0HmOO+P8P3AbQjWthyNdjbgJoZu57r6M=";
  };

  vendorHash = "sha256-fUrMpRF0q7ZNkWe5Hadt23vEtWBKp7F5Jv8zGkKwlDA=";

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
