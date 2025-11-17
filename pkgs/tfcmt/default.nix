{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "tfcmt";
  version = "v4.14.12";

  src = fetchFromGitHub {
    owner = "suzuki-shunsuke";
    repo = "tfcmt";
    rev = "4836eb9e4acbd0b5be7dfaf14a00df771322f0a6"; # v4.14.12
    hash = "sha256-S7zH8TxRRzRjLG9b3ixeCsOdMwNU10W6jFoqILPuGPs=";
  };

  vendorHash = "sha256-f/dKs9MkhSrWrmbmJLDMUDDwgrwWMs1q0WKnfHVioyU=";
  ldflags = [ "-X=main.Version=${version}" ];
  doCheck = false;

  meta = {
    description = "tfcmt enhances mercari/tfnotify in many ways, including Terraform >= v0.15 support and advanced formatting options";
    homepage = "https://suzuki-shunsuke.github.io/tfcmt/";
    mainProgram = "tfcmt";
  };
}
