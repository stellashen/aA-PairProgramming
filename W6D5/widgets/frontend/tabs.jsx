import React from 'react';
import ReactDOM from 'react-dom';

export default class Tabs extends React.Component {
	constructor(props) {
		super(props);
		this.panes = this.props.panes;
		console.log(this.panes);

		this.state = {
			selectedIdx: 0
		};
	}

	render() {
		let selectedPane = this.panes[this.state.selectedIdx];
		let headers = this.panes.map(pane => {
			if (pane === selectedPane) {
				return (
					<h1>
						<strong>{pane.title}</strong>
					</h1>
				);
			} else {
				return <h1>{pane.title}</h1>;
			}
		});

		return (
			<div>
				<ul>{headers}</ul>
				<article />
			</div>
		);
	}
}
