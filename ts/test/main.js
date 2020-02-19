const test = require('ava');
const {main} = require('../src/main');

test('main()', t => {
	t.is(main(), 'success');
});
