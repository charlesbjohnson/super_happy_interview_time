use std::ops::{Index, IndexMut};
use std::ptr;

pub struct Node<T> {
    value: T,
    next: Option<Box<Node<T>>>,
    prev: *mut Node<T>,
}

pub struct LinkedList<T> {
    len: usize,
    head: Option<Box<Node<T>>>,
    tail: *mut Node<T>,
}

pub struct IntoIter<T>(LinkedList<T>);

pub struct Iter<'n, T: 'n> {
    front: Option<&'n Node<T>>,
    back: *const Node<T>,
}

pub struct IterMut<'n, T: 'n> {
    front: Option<&'n mut Node<T>>,
}

impl<T> Node<T> {
    fn new(value: T) -> Box<Self> {
        Box::new(Self {
            value,
            next: None,
            prev: ptr::null_mut(),
        })
    }
}

impl<T> LinkedList<T> {
    pub fn new() -> Self {
        Default::default()
    }

    pub fn len(&self) -> usize {
        self.len
    }

    pub fn is_empty(&self) -> bool {
        self.len == 0
    }

    pub fn push_front(&mut self, value: T) {
        let mut new = Node::new(value);
        let raw: *mut _ = &mut *new;

        match self.head.take() {
            Some(mut old) => {
                old.prev = raw;
                new.next = Some(old);
            }
            None => {
                self.tail = raw;
            }
        }

        self.head = Some(new);
        self.len += 1;
    }

    pub fn push_back(&mut self, value: T) {
        if self.head.is_none() {
            return self.push_front(value);
        }

        let mut new = Node::new(value);
        let raw: *mut _ = &mut *new;

        new.prev = self.tail;
        unsafe {
            (*self.tail).next = Some(new);
        }

        self.tail = raw;
        self.len += 1;
    }

    pub fn insert(&mut self, index: usize, value: T) {
        assert!(index <= self.len);

        if index == 0 {
            return self.push_front(value);
        }

        if index == self.len {
            return self.push_back(value);
        }

        let mut new = Node::new(value);
        {
            let prev = self.get_mut(index - 1);
            let mut next = prev.next.take().unwrap();

            next.prev = &mut *new;
            new.next = Some(next);

            new.prev = &mut *prev;
            prev.next = Some(new);
        }

        self.len += 1;
    }

    pub fn pop_front(&mut self) -> Option<T> {
        self.head.take().map(|mut doomed| {
            match doomed.next.take() {
                Some(mut node) => {
                    node.prev = ptr::null_mut();
                    self.head = Some(node);
                }
                None => {
                    self.tail = ptr::null_mut();
                }
            }

            self.len -= 1;
            doomed.value
        })
    }

    pub fn pop_back(&mut self) -> Option<T> {
        if self.len < 2 {
            return self.pop_front();
        }

        let value = unsafe {
            let prev = &mut *(*self.tail).prev;
            let raw: *mut _ = &mut *prev;

            (*self.tail).prev = ptr::null_mut();
            self.tail = raw;

            prev.next.take().map(|node| node.value)
        };

        self.len -= 1;
        value
    }

    pub fn remove(&mut self, index: usize) -> T {
        assert!(index < self.len);

        if index == 0 {
            return self.pop_front().unwrap();
        }

        if index == self.len - 1 {
            return self.pop_back().unwrap();
        }

        let value = {
            let mut prev = self.get_mut(index - 1);
            let raw: *mut _ = &mut *prev;

            let mut doomed = prev.next.take().unwrap();
            doomed.prev = ptr::null_mut();

            prev.next = doomed.next.take().map(|mut node| {
                node.prev = raw;
                node
            });

            doomed.value
        };

        self.len -= 1;
        value
    }

    pub fn front(&self) -> Option<&T> {
        self.head.as_ref().map(|node| &node.value)
    }

    pub fn front_mut(&mut self) -> Option<&mut T> {
        self.head.as_mut().map(|node| &mut node.value)
    }

    pub fn back(&self) -> Option<&T> {
        if self.tail.is_null() {
            return None;
        }

        Some(unsafe { &(*self.tail).value })
    }

    pub fn back_mut(&mut self) -> Option<&mut T> {
        if self.tail.is_null() {
            return None;
        }

        Some(unsafe { &mut (*self.tail).value })
    }

    pub fn iter(&self) -> Iter<T> {
        Iter {
            front: self.head.as_ref().map(|node| &**node),
            back: self.tail,
        }
    }

    pub fn iter_mut(&mut self) -> IterMut<T> {
        IterMut {
            front: self.head.as_mut().map(|node| &mut **node),
        }
    }

    fn get(&self, index: usize) -> &Node<T> {
        let mut i = 0;
        let mut current = self.head.as_ref().map(|node| &**node);

        while i < index {
            i += 1;
            if let Some(node) = current.take() {
                current = node.next.as_ref().map(|node| &**node);
            }
        }

        current.unwrap()
    }

    fn get_mut(&mut self, index: usize) -> &mut Node<T> {
        let mut i = 0;
        let mut current = self.head.as_mut().map(|node| &mut **node);

        while i < index {
            i += 1;
            if let Some(node) = current.take() {
                current = node.next.as_mut().map(|node| &mut **node);
            }
        }

        current.unwrap()
    }
}

impl<T> Default for LinkedList<T> {
    fn default() -> Self {
        Self {
            len: 0,
            head: None,
            tail: ptr::null_mut(),
        }
    }
}

impl<T> Drop for LinkedList<T> {
    fn drop(&mut self) {
        while self.pop_front().is_some() {}
    }
}

impl<T> Index<usize> for LinkedList<T> {
    type Output = T;

    fn index(&self, index: usize) -> &Self::Output {
        assert!(index < self.len);
        &self.get(index).value
    }
}

impl<T> IndexMut<usize> for LinkedList<T> {
    fn index_mut(&mut self, index: usize) -> &mut Self::Output {
        assert!(index < self.len);
        &mut self.get_mut(index).value
    }
}

impl<T> IntoIterator for LinkedList<T> {
    type Item = T;
    type IntoIter = IntoIter<Self::Item>;

    fn into_iter(self) -> Self::IntoIter {
        IntoIter(self)
    }
}

impl<T> Iterator for IntoIter<T> {
    type Item = T;

    fn next(&mut self) -> Option<Self::Item> {
        self.0.pop_front()
    }
}

impl<T> DoubleEndedIterator for IntoIter<T> {
    fn next_back(&mut self) -> Option<Self::Item> {
        self.0.pop_back()
    }
}

impl<'n, T> Iterator for Iter<'n, T> {
    type Item = &'n T;

    fn next(&mut self) -> Option<Self::Item> {
        self.front.take().map(|node| {
            self.front = node.next.as_ref().map(|node| &**node);
            &node.value
        })
    }
}

impl<'n, T> DoubleEndedIterator for Iter<'n, T> {
    fn next_back(&mut self) -> Option<Self::Item> {
        if self.back.is_null() {
            return None;
        }

        Some(unsafe {
            let prev = self.back;
            self.back = (*self.back).prev;
            &(*prev).value
        })
    }
}

impl<'n, T> Iterator for IterMut<'n, T> {
    type Item = &'n mut T;

    fn next(&mut self) -> Option<Self::Item> {
        self.front.take().map(|node| {
            self.front = node.next.as_mut().map(|node| &mut **node);
            &mut node.value
        })
    }
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn empty() {
        let list = LinkedList::<i32>::new();
        assert_eq!(list.len(), 0);
        assert_eq!(list.is_empty(), true);
    }

    #[test]
    fn push_front_non_empty() {
        let mut list = LinkedList::new();
        for v in 0..3 {
            list.push_front(v);
        }

        assert_eq!(list.len(), 3);
        assert_eq!(list.is_empty(), false);
    }

    #[test]
    fn push_back_non_empty() {
        let mut list = LinkedList::new();
        for v in 0..3 {
            list.push_back(v);
        }

        assert_eq!(list.len(), 3);
        assert_eq!(list.is_empty(), false);
    }

    #[test]
    fn into_iter() {
        let mut list = LinkedList::new();
        assert_eq!(list.into_iter().next(), None);

        list = LinkedList::new();
        for v in 0..3 {
            list.push_front(v);
            list.push_back(v);
        }

        let mut iter = list.into_iter();
        assert_eq!(iter.next(), Some(2));
        assert_eq!(iter.next_back(), Some(2));

        assert_eq!(iter.next(), Some(1));
        assert_eq!(iter.next_back(), Some(1));

        assert_eq!(iter.next(), Some(0));
        assert_eq!(iter.next_back(), Some(0));

        assert_eq!(iter.next(), None);
        assert_eq!(iter.next_back(), None);
    }

    #[test]
    fn iter() {
        let mut list = LinkedList::new();
        assert_eq!(list.iter().next(), None);

        for v in 0..3 {
            list.push_front(v);
            list.push_back(v);
        }

        let mut iter = list.iter();
        assert_eq!(iter.next(), Some(&2));
        assert_eq!(iter.next_back(), Some(&2));

        assert_eq!(iter.next(), Some(&1));
        assert_eq!(iter.next_back(), Some(&1));

        assert_eq!(iter.next(), Some(&0));
        assert_eq!(iter.next_back(), Some(&0));

        assert_eq!(iter.next(), Some(&0));
        assert_eq!(iter.next_back(), Some(&0));

        assert_eq!(iter.next(), Some(&1));
        assert_eq!(iter.next_back(), Some(&1));

        assert_eq!(iter.next(), Some(&2));
        assert_eq!(iter.next_back(), Some(&2));

        assert_eq!(iter.next(), None);
        assert_eq!(iter.next_back(), None);
    }

    #[test]
    fn iter_mut() {
        let mut list = LinkedList::new();
        assert_eq!(list.iter_mut().next(), None);

        for v in 0..3 {
            list.push_front(v);
            list.push_back(v);
        }

        let mut iter = list.iter_mut();
        assert_eq!(iter.next(), Some(&mut 2));
        assert_eq!(iter.next(), Some(&mut 1));
        assert_eq!(iter.next(), Some(&mut 0));
        assert_eq!(iter.next(), Some(&mut 0));
        assert_eq!(iter.next(), Some(&mut 1));
        assert_eq!(iter.next(), Some(&mut 2));
        assert_eq!(iter.next(), None);
    }

    #[test]
    fn push_front_pop_front() {
        let mut list = LinkedList::new();
        assert_eq!(list.pop_front(), None);
        assert_eq!(list.len(), 0);

        list.push_front(0);
        list.push_front(1);

        assert_eq!(list.pop_front(), Some(1));
        assert_eq!(list.pop_front(), Some(0));
        assert_eq!(list.pop_front(), None);
    }

    #[test]
    fn push_front_pop_back() {
        let mut list = LinkedList::new();
        assert_eq!(list.pop_back(), None);
        assert_eq!(list.len(), 0);

        list.push_front(0);
        list.push_front(1);

        assert_eq!(list.pop_back(), Some(0));
        assert_eq!(list.pop_back(), Some(1));
        assert_eq!(list.pop_back(), None);
    }

    #[test]
    fn push_back_pop_back() {
        let mut list = LinkedList::new();
        assert_eq!(list.pop_back(), None);
        assert_eq!(list.len(), 0);

        list.push_back(0);
        list.push_back(1);

        assert_eq!(list.pop_back(), Some(1));
        assert_eq!(list.pop_back(), Some(0));
        assert_eq!(list.pop_back(), None);
    }

    #[test]
    fn push_back_pop_front() {
        let mut list = LinkedList::new();
        assert_eq!(list.pop_front(), None);
        assert_eq!(list.len(), 0);

        list.push_back(0);
        list.push_back(1);

        assert_eq!(list.pop_front(), Some(0));
        assert_eq!(list.pop_front(), Some(1));
        assert_eq!(list.pop_front(), None);
    }

    #[test]
    fn front() {
        let mut list = LinkedList::new();
        assert_eq!(list.front(), None);
        assert_eq!(list.front_mut(), None);

        list.push_front(0);
        assert_eq!(list.front(), Some(&0));
        assert_eq!(list.front_mut(), Some(&mut 0));

        list.push_back(1);
        assert_eq!(list.front(), Some(&0));
        assert_eq!(list.front_mut(), Some(&mut 0));

        list.push_front(-1);
        assert_eq!(list.front(), Some(&-1));
        assert_eq!(list.front_mut(), Some(&mut -1));

        list.pop_front();
        assert_eq!(list.front(), Some(&0));
        assert_eq!(list.front_mut(), Some(&mut 0));
    }

    #[test]
    fn back() {
        let mut list = LinkedList::new();
        assert_eq!(list.back(), None);
        assert_eq!(list.back_mut(), None);

        list.push_back(0);
        assert_eq!(list.back(), Some(&0));
        assert_eq!(list.back_mut(), Some(&mut 0));

        list.push_front(-1);
        assert_eq!(list.back(), Some(&0));
        assert_eq!(list.back_mut(), Some(&mut 0));

        list.push_back(1);
        assert_eq!(list.back(), Some(&1));
        assert_eq!(list.back_mut(), Some(&mut 1));

        list.pop_back();
        assert_eq!(list.back(), Some(&0));
        assert_eq!(list.back_mut(), Some(&mut 0));
    }

    #[test]
    #[should_panic]
    fn insert_out_of_bounds() {
        let mut list = LinkedList::new();
        list.insert(1, 0);
    }

    #[test]
    fn insert() {
        let mut list = LinkedList::new();

        list.insert(0, 0);
        list.insert(1, 2);
        list.insert(1, 1);

        assert_eq!(list.len(), 3);
        assert_eq!(list.pop_front(), Some(0));
        assert_eq!(list.pop_back(), Some(2));
        assert_eq!(list.pop_front(), Some(1));

        assert_eq!(list.pop_front(), None);
        assert_eq!(list.pop_back(), None);
    }

    #[test]
    #[should_panic]
    fn remove_out_of_bounds() {
        let mut list = LinkedList::<i32>::new();
        list.remove(1);
    }

    #[test]
    fn remove() {
        let mut list = LinkedList::new();

        list.insert(0, 0);
        assert_eq!(list.remove(0), 0);
        assert_eq!(list.len(), 0);

        list.insert(0, 0);
        list.insert(1, 1);
        assert_eq!(list.remove(1), 1);
        assert_eq!(list.len(), 1);
        assert_eq!(list.front(), Some(&0));

        list.insert(1, 1);
        list.insert(2, 2);
        assert_eq!(list.remove(1), 1);
        assert_eq!(list.len(), 2);
        assert_eq!(list.front(), Some(&0));
        assert_eq!(list.back(), Some(&2));

        assert_eq!(list.remove(0), 0);
        assert_eq!(list.remove(0), 2);
        assert_eq!(list.len(), 0);
    }

    #[test]
    #[should_panic]
    fn index_out_of_bounds() {
        let list = LinkedList::<i32>::new();
        list.index(0);
    }

    #[test]
    fn index() {
        let mut list = LinkedList::new();

        list.push_front(0);
        list.push_back(1);

        assert_eq!(list.index(0), &0);
        assert_eq!(list.index_mut(0), &mut 0);

        assert_eq!(list.index(1), &1);
        assert_eq!(list.index_mut(1), &mut 1);

        list.push_front(-1);
        list.push_back(2);

        assert_eq!(list.index(0), &-1);
        assert_eq!(list.index_mut(0), &mut -1);

        assert_eq!(list.index(1), &0);
        assert_eq!(list.index_mut(1), &mut 0);

        assert_eq!(list.index(2), &1);
        assert_eq!(list.index_mut(2), &mut 1);

        assert_eq!(list.index(3), &2);
        assert_eq!(list.index_mut(3), &mut 2);
    }
}
