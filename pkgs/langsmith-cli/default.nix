{ lib, buildGo126Module, fetchFromGitHub }:
let
  version = "0.3.1";
in
buildGo126Module {
  pname = "langsmith-cli";
  inherit version;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langsmith-cli";
    tag = "v${version}";
    hash = "sha256-mxXsW9901ZKHvODJ7fMtfa9qVTLedXj63sg3k+n8bV4=";
  };

  vendorHash = "sha256-tRKwc56ChFfKdJe/3ktL00/ypig14lWoJKW5q4UWdfw=";

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
