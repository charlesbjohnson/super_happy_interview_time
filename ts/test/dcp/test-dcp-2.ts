import test, {Macro} from 'ava';
import {todo} from '../../src/dcp/dcp-2';

const cases: boolean[] = [false];

const macro: Macro<[boolean]> = (t, expected) => {
	t.is(todo(), expected);
};

macro.title = (i: string | undefined): string => `todo()_${i ?? ''}`;

for (const [i, expected] of cases.entries()) {
	test(i.toString(), macro, expected);
}
