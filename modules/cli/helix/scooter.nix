{ self, ... }:
{
  packages = self.lib.perSystem (pkgs: {
    scooter-hx =
      let
        src = pkgs.fetchFromGitHub {
          owner = "thomasschafer";
          repo = "scooter.hx";
          rev = "5624e8126715705d644d2252020b8ed9b506c187";
          hash = "sha256-kK1OOQPZfltOKCZAGHZfhYgja8N7DBpCnCvhdmzOo28=";
        };
      in
      pkgs.rustPlatform.buildRustPackage {
        pname = "scooter-hx";
        version = "0.3.0";
        inherit src;
        cargoLock = {
          lockFile = "${src}/Cargo.lock";
          allowBuiltinFetchGit = true;
        };
        doCheck = false;
        nativeBuildInputs = [ pkgs.pkg-config ];
        installPhase = ''
          runHook preInstall
          install -Dm755 target/*/release/libscooter_hx.so $out/lib/libscooter_hx.so
          runHook postInstall
        '';
      };
  });
}
