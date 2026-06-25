{
  outputs = args: (import ./default.nix) { tackOverrides = args.tackOverrides or { }; };
}
