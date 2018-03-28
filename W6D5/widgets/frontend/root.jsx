import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';

const Panes = [
	{ title: 'one', content: 'I am the first' },
	{ title: 'two', content: 'Second pane here' },
	{ title: 'three', content: 'Third pane here' }
];

class Root extends React.Component {
	render() {
		return (
			<main>
				<Clock />
				<Tabs panes={Panes} />
			</main>
		);
	}
}

export default Root;
