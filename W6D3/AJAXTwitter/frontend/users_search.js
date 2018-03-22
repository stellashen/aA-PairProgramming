const APIUtil = require('./api_util.js');

class UsersSearch {
  constructor($el) {
    this.$el = $el;
    this.input = "";
    this.ul = "";
  }

  handleInput() {
    this.$el.on('input', (e) => {
      APIUtil.searchUsers(this.$el.text, this.renderResults);
    });
  }

  renderResults() {
    $('ul.users').text("");
  }


}

module.exports = UsersSearch;
