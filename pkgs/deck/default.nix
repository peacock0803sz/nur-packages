{ lib, buildGo126Module, fetchFromGitHub }:
# https://github.com/k1LoW/deck
let
  version = "1.24.4";
  pname = "deck";
in
buildGo126Module {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "k1LoW";
    repo = pname;
    tag = "v${version}";
    hash = "sha256-lTBanbAb0klUrqhvhyht4u+K006YgiXya2ovg/ElrL4=";
  };

  vendorHash = "sha256-06OqWG5Mn7avaTDL5YJgcKjQ/JWTAB2Cqg/DMINGydo=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/k1LoW/${pname}/version/version.Version=v${version}"
  ];
  doCheck = false;

  meta = {
    description = "deck is a tool for creating deck using Markdown and Google Slides.";
    homepage = "https://github.com/k1LoW/deck";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
    mainProgram = "gwq";
  };
}
