/*
 * Description:
 * Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
 *
 * Examples:
 * Input: list = [10, 15, 3, 7], target = 17
 * Output: true
 */
export function isTwoSum(list: number[], target: number): boolean {
	const seen = new Set();

	for (const value of list) {
		if (seen.has(target - value)) {
			return true;
		}

		seen.add(value);
	}

	return false;
}
