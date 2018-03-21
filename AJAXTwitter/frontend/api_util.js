const APIUtil = {
  followUser: id => {
    $.ajax({
      url: `/users/${id}/follow`,
      type: 'POST',
      dataType: 'JSON'
    });
  },

  unfollowUser: id => {
    $.ajax({
      url: `/users/${id}/follow`,
      type: 'DELETE',
      dataType: 'JSON'
    });
  }
};

module.exports = APIUtil;
