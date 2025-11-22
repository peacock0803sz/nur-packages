{ lib, buildGoModule, fetchFromGitHub }:
let
  version = "v4.14.12";
in
buildGoModule {
  pname = "tfcmt";
  version = version;

  src = fetchFromGitHub {
    owner = "suzuki-shunsuke";
    repo = "tfcmt";
    rev = version;
    hash = "sha256-ivMpjQqfmgKKNGqD/gZUT7z1II1JoO5GlSb5NMXvHLg=";
  };

  vendorHash = "sha256-O/T67nOpwnqHqPNnNMvwYp9fG+Qrw8GrCa+LAHnKE/s=";
  ldflags = [ "-s" "-w" "-X=main.version=${version}" ];

  meta = {
    description = "tfcmt enhances mercari/tfnotify in many ways, including Terraform >= v0.15 support and advanced formatting options";
    homepage = "https://suzuki-shunsuke.github.io/tfcmt/";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
    mainProgram = "tfcmt";
  };
}
