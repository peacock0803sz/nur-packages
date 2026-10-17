{ lib, buildGo126Module, fetchFromGitHub }:
let
  version = "0.3.3";
in
buildGo126Module {
  pname = "langsmith-cli";
  inherit version;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langsmith-cli";
    tag = "v${version}";
    hash = "sha256-9HjkTGSY19NwA8Pu4RTiPja0xxMT2OFYxZKZZ2PlD4c=";
  };

  vendorHash = "sha256-BTzo2i7ppPIjDxIlkKEerQfRyqrjIxrRr8EXjnHJetg=";

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
