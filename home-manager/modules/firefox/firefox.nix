{lib, ...}:
{
	programs.firefox = {
		enable = true;
		profiles."vismorf" = {
			userChrome = builtins.readFile ./userChrome.css;
			settings = {
			# Performance settings
				"gfx.webrender.all" = true; # Force enable GPU acceleration
				"media.ffmpeg.vaapi.enabled" = true;
				"widget.dmabuf.force-enabled" = true; # Required in recent Firefoxes

			# Hide the "sharing indicator", it's especially annoying
			# with tiling WMs on wayland
				"privacy.webrtc.legacyGlobalIndicator" = false;

				"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
				"extensions.pocket.enabled" = false;
				"browser.toolbars.bookmarks.visibility" = "always";
			};
		};
	};
}
