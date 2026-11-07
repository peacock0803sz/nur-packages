{ lib, buildGo126Module, fetchFromGitHub }:
let
  version = "0.3.13";
in
buildGo126Module {
  pname = "langsmith-cli";
  inherit version;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langsmith-cli";
    tag = "v${version}";
    hash = "sha256-SVIjHBtjpSVwCCLETNAToUD4LahKAW/wNEpTWtTInyI=";
  };

  vendorHash = "sha256-NzHRYVukqEvDz2D2VmK25b+ly82GfwFCZ8kaUPiy/AU=";

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
