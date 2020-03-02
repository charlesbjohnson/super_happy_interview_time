import test, {Macro} from 'ava';
import {isTwoSum} from '../../src/dcp/dcp-1';

const cases: Array<[number[], number, boolean]> = [
	[[], 0, false],
	[[0, 1], 0, false],
	[[0, 1], 1, true],
	[[0, 1, 2], 1, true],
	[[0, 1, 2], 3, true],
	[[0, 1, 2], 2, true],
	[[0, 1, 2], 2, true]
];

const macro: Macro<[number[], number, boolean]> = (
	t,
	list,
	target,
	expected
) => {
	t.is(isTwoSum(list, target), expected);
};

macro.title = (i: string | undefined): string => `isTwoSum()_${i ?? ''}`;

for (const [i, [list, target, expected]] of cases.entries()) {
	test(i.toString(), macro, list, target, expected);
}
