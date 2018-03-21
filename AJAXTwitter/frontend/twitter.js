const FollowToggle = require('./follow_toggle.js');

$(document).on('ready', () => {
  $('.follow-toggle').each(function(idx, el) {
    const toggle = new FollowToggle($(el));
  });
});
