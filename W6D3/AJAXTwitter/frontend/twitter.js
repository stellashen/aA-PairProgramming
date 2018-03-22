const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js')

$(document).on('ready', () => {
  $('.follow-toggle').each(function(idx, el) {
    const toggle = new FollowToggle($(el));
  });

  $('nav.users-search').each(function(idx, el) {
    const usersSearch = new UsersSearch($(el));
  });
});
