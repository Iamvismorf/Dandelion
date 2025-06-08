{lib, ...}:
{

programs.ghostty = {
	enable = true;
	settings = {
		# font-family = lib.mkForce "Hack nerd font";
		font-style = "bold";
		font-size = 12;
		adjust-cell-height = "20%";
		link-url = false;
	};
};
}
