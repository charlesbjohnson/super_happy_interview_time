struct Node<T> {
    value: T,
    next: Option<Box<Node<T>>>,
}

pub struct Bag<T> {
    len: usize,
    head: Option<Box<Node<T>>>,
}

pub struct Iter<'n, T: 'n> {
    current: Option<&'n Node<T>>,
}

pub struct IterMut<'n, T: 'n> {
    current: Option<&'n mut Node<T>>,
}

impl<T> Bag<T> {
    pub fn new() -> Self {
        Default::default()
    }

    pub fn add(&mut self, value: T) {
        let node = Box::new(Node {
            value,
            next: self.head.take(),
        });

        self.head = Some(node);
        self.len += 1;
    }

    pub fn len(&self) -> usize {
        self.len
    }

    pub fn is_empty(&self) -> bool {
        self.len == 0
    }

    pub fn iter(&self) -> Iter<T> {
        Iter {
            current: self.head.as_ref().map(|node| &**node),
        }
    }

    pub fn iter_mut(&mut self) -> IterMut<T> {
        IterMut {
            current: self.head.as_mut().map(|node| &mut **node),
        }
    }
}

impl<T> Default for Bag<T> {
    fn default() -> Self {
        Self { len: 0, head: None }
    }
}

impl<T> Drop for Bag<T> {
    fn drop(&mut self) {
        let mut current = self.head.take();
        while let Some(mut node) = current {
            current = node.next.take();
        }

        self.len = 0;
    }
}

impl<'n, T> Iterator for Iter<'n, T> {
    type Item = &'n T;

    fn next(&mut self) -> Option<Self::Item> {
        self.current.map(|node| {
            self.current = node.next.as_ref().map(|node| &**node);
            &node.value
        })
    }
}

impl<'n, T> Iterator for IterMut<'n, T> {
    type Item = &'n mut T;

    fn next(&mut self) -> Option<Self::Item> {
        self.current.take().map(|node| {
            self.current = node.next.as_mut().map(|node| &mut **node);
            &mut node.value
        })
    }
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn empty() {
        let bag = Bag::<i32>::new();
        assert_eq!(bag.len(), 0);
        assert_eq!(bag.is_empty(), true);
    }

    #[test]
    fn non_empty() {
        let mut bag = Bag::new();
        for v in 0..3 {
            bag.add(v);
        }

        assert_eq!(bag.len(), 3);
        assert_eq!(bag.is_empty(), false);
    }

    #[test]
    fn iter() {
        let mut bag = Bag::new();
        assert_eq!(bag.iter().next(), None);

        for v in 0..3 {
            bag.add(v);
        }

        let mut iter = bag.iter();
        assert_eq!(iter.next(), Some(&2));
        assert_eq!(iter.next(), Some(&1));
        assert_eq!(iter.next(), Some(&0));
        assert_eq!(iter.next(), None);
    }

    #[test]
    fn iter_mut() {
        let mut bag = Bag::<i32>::new();
        assert_eq!(bag.iter_mut().next(), None);

        let mut bag = Bag::new();
        for v in 0..3 {
            bag.add(v);
        }

        let mut iter = bag.iter_mut();
        assert_eq!(iter.next(), Some(&mut 2));
        assert_eq!(iter.next(), Some(&mut 1));
        assert_eq!(iter.next(), Some(&mut 0));
        assert_eq!(iter.next(), None);
    }
}
