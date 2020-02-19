import test from 'ava';
import {main} from '../src/main';

test('main()', t => {
	t.is(main(), 'success');
});
