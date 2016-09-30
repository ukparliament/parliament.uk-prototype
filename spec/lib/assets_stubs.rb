LORD_CARD = '<div class=\"lord-card\" style=\"border: 2px solid red\">\n  <p>\n    <% if local_assigns.include?(:display_name) %>\n        <%= raw display_name %>\n    <% else %>\n        Lord/Baroness display_name\n    <% end %>\n  </p>\n</div>'
HEADER = '<div class="sitewide-message">
  <div class="wrapper">
    <p>Experimental prototypes using fake data for the alpha phase of the Parliament UK website.</p>
  </div>
</div>
<header>
  <div class="wrapper">
    <a href="#" class="site-logo">
      <img class="site-logo" src="https://dl.dropboxusercontent.com/s/48phil2j9e7unl8/parliament-uk--white-3170f1a067ea430d34036c37bed20359571abf45245d935fcf885962f2c05465.svg?dl=0" alt="Parliament.uk">
    </a>
  </div>
</header>'
LAYOUT = '<link rel="stylesheet" href="https://dl.dropboxusercontent.com/s/qn1kh910969ym0x/application.css?dl=0" type="text/css">
<script src="https://dl.dropbox.com/s/mqn1h16odjvzfxw/application.js?dl=0" type="application/javascript"></script>'