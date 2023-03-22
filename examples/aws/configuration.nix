{ pkgs, inputs, ... }:

let
  inherit (inputs) nixpkgs;
in
{
  imports = [
    "${nixpkgs}/nixos/modules/virtualisation/amazon-image.nix"
    ./users.nix
  ];
  ec2.hvm = true;

  networking.hostName = "example";
  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ 80 443 ];

  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
    git
  ];

  services.openssh.enable = true;

  # Nix configuration
  nix.settings.trusted-users = ["@wheel"];
  nix = {
    # Clean up /nix/store/ after a week
    gc = {
      automatic = true;
      dates = "weekly UTC";
      options = "--delete-older-than 14d";
    };
  };

  system.stateVersion = "22.11";
}
