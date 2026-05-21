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
        };
      };
    };
  };
}
