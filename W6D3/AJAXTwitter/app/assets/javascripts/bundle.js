/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3)

$(document).on('ready', () => {
  $('.follow-toggle').each(function(idx, el) {
    const toggle = new FollowToggle($(el));
  });

  $('nav.users-search').each(function(idx, el) {
    const usersSearch = new UsersSearch($(el));
  });
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map