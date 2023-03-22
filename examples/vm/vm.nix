{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_6_0;
  services.openssh.enable = true;
}
