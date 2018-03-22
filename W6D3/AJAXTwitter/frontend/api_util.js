const APIUtil = {
  followUser: id => {
    const promise = $.ajax({
      url: `/users/${id}/follow`,
      type: 'POST',
      dataType: 'JSON',
    });
    return promise;
  },

  unfollowUser: id => {
    const promise = $.ajax({
      url: `/users/${id}/follow`,
      type: 'DELETE',
      dataType: 'JSON',
    });
    return promise;
  },

  searchUsers: (queryVal, success) => {
    $.ajax({
      url: '/users/search',
      type: 'GET',
      dataType: 'JSON',
      data: {
        query: queryVal
      },
      success: success
    });
  }
};

module.exports = APIUtil;
