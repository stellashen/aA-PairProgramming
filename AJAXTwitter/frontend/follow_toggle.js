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
    if (this.followState === "following" || this.followState === "unfollowing") {
      this.$el.prop('disabled', true);
    } else {
      this.$el.prop('disabled', false);
    }

    if (this.followState === "followed") {
      this.$el.text('Unfollow!');
    } else {
      this.$el.text('Follow!');
    }
  }

  handleClick(e) {
    e.preventDefault();

    if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      const promise = APIUtil.followUser(this.userId);
      promise.then( () => this.successFollow() );

      // const gizmo = new Cat('gizmo')
      // gizmo.meow() // this === gizmo
      // const gizmoMeow = () => gizmo.meow();
      // gizmoMeow() // this === gizmo
    } else {
      this.followState = "unfollowing";
      this.render();
      const promise = APIUtil.unfollowUser(this.userId);
      promise.then( () => this.successUnfollow() );
    }


// .catch(rejectedUnfollowed.bind(this))
// .catch(rejectedFollowed.bind(this))
  }

  successFollow() {
    this.followState = "followed";
    this.render();
  }

  successUnfollow() {
    this.followState = "unfollowed";
    this.render();
  }

  rejectedFollowed() {
    this.followState = "followed";
    alert('Did not work');
  }

  rejectedUnfollowed() {
    this.followState = "unfollowed";
    alert('Did not work');
  }
}

// buttonFollow.on('click', (e) => {
//   buttonFollow.toggleClass('follow-toggle');
// });


module.exports = FollowToggle;
