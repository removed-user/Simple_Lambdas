{
  description = "A reusable utility lambdas library for flake-parts injected at the top-level flake context";

  outputs = { self, ... }: {
    # Export the flakeModule
    flakeModules.default = { lib, ... }: {
      config = {
        # Inject into the top-level flake module arguments
        _module.args.lambdas = {
          ### Directory Contents utility lambda
          dirContents = path: builtins.readDir path;
### Return only the .nix files from an attribute set
nixFiles = contents: lib.filterAttrs (
    name: type: type == "regular" && lib.hasSuffix ".nix" name
  ) contents;
### Convert a Json file to a nix attribute set
readJson = path: builtins.fromJSON (builtins.readFile path);
        };
      };
    };
  };
}
