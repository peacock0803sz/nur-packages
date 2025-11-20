{ buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "tfcmt";
  version = "v4.14.11";

  src = fetchFromGitHub {
    owner = "suzuki-shunsuke";
    repo = "tfcmt";
    rev = "7caae6525b6de3681af146188e9e7b010c8559f7"; # v4.14.11
    hash = "sha256-ivMpjQqfmgKKNGqD/gZUT7z1II1JoO5GlSb5NMXvHLg=";
  };

  vendorHash = "sha256-O/T67nOpwnqHqPNnNMvwYp9fG+Qrw8GrCa+LAHnKE/s=";
  ldflags = [ "-X=main.Version=${version}" ];
  doCheck = false;

  meta = {
    description = "tfcmt enhances mercari/tfnotify in many ways, including Terraform >= v0.15 support and advanced formatting options";
    homepage = "https://suzuki-shunsuke.github.io/tfcmt/";
    mainProgram = "tfcmt";
  };
}
