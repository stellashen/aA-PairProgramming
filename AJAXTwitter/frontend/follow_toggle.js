const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor($el) {
    this.$el = $el;
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');

    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.text('Follow!');
    } else {
      this.$el.text('Unfollow!');
    }
  }

  handleClick(e) {
    // let method;
    // this.$el.on("click", (e) => {
    e.preventDefault();
    if (this.followState === "unfollowed") {
      APIUtil.followUser(this.userId);
      this.followState = "followed";
    } else {
      APIUtil.unfollowUser(this.userId);
      this.followState = "unfollowed";
    }
    this.render();
  }
}

// buttonFollow.on('click', (e) => {
//   buttonFollow.toggleClass('follow-toggle');
// });


module.exports = FollowToggle;
