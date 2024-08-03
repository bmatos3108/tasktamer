
$(document).on('turbolinks:load', function() {
  const $sidebarButton = $('.AppSidebar__lockButton');
  const $sidebar = $('.AppSidebar');

  if ($sidebarButton.length) {
    $sidebarButton.on('click', function() {
      $sidebar.toggleClass('AppSidebar--isOpen');
    });
  }
});
