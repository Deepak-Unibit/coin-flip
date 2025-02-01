import 'dart:html' as html;

class UrlLauncherHelper {
  static void launchLink(String urlLink)  {
    html.window.open(urlLink, '_blank');
  }
}