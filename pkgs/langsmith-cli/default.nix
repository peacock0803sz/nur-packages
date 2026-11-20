{ lib, buildGo126Module, fetchFromGitHub }:
let
  version = "0.4.0";
in
buildGo126Module {
  pname = "langsmith-cli";
  inherit version;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langsmith-cli";
    tag = "v${version}";
    hash = "sha256-cj6Ns3GtBs2qKQo2GX7KzS46p7bf7/jxo7h3wjUTZAI=";
  };

  vendorHash = "sha256-7Fd261ShibmRAbTw/GVhaUyYslcKQho2slgKX+4sKWc=";

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
