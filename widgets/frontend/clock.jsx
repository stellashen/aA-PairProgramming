import React from 'react';
import ReactDOM from 'react-dom';

export default class Clock extends React.Component {
	constructor() {
		super();
		this.state = {
			time: new Date()
		};
	}

	componentDidMount() {
		this.tick();
	}

	componentWillUnmount() {
		clearInterval(this.handle);
	}

	render() {
		return (
			<div>
				<h1>Awesome clock ticking</h1>

				<h2 className="clock" />
			</div>
		);
	}

	_display() {
		const currentTime = this.state.time;
		let hrs = currentTime.getHours();
		let min = currentTime.getMinutes();
		let sec = currentTime.getSeconds();

		if (hrs < 10) {
			hrs = '0' + hrs;
		}
		if (min < 10) {
			min = '0' + min;
		}
		if (sec < 10) {
			sec = '0' + sec;
		}

		const text = `${hrs}:${min}:${sec}`;
		const clock = document.querySelectorAll('.clock')[0];
		clock.textContent = text;
	}

	tick() {
		this.handle = setInterval(() => {
			this.setState({
				time: new Date()
			});
			this._display();
		}, 1000);
	}
}
