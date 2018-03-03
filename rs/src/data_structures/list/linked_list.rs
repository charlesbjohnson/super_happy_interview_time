use std::cell::{Ref, RefCell};
use std::rc::{Rc, Weak};

struct Node<T> {
    value: T,
    next: Option<Rc<RefCell<Node<T>>>>,
    prev: Weak<RefCell<Node<T>>>,
}

pub struct LinkedList<T> {
    len: usize,
    head: Option<Rc<RefCell<Node<T>>>>,
    tail: Option<Rc<RefCell<Node<T>>>>,
}

pub struct IntoIter<T>(LinkedList<T>);

impl<T> Node<T> {
    pub fn new(value: T) -> Rc<RefCell<Self>> {
        Rc::new(RefCell::new(Self {
            value,
            next: None,
            prev: Weak::new(),
        }))
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
        let new = Node::new(value);

        match self.head.take() {
            Some(old) => {
                old.borrow_mut().prev = Rc::downgrade(&new);
                new.borrow_mut().next = Some(old);
            }
            None => {
                self.tail = Some(new.clone());
            }
        }

        self.head = Some(new);
        self.len += 1;
    }

    pub fn push_back(&mut self, value: T) {
        let new = Node::new(value);

        match self.tail.take() {
            Some(old) => {
                new.borrow_mut().prev = Rc::downgrade(&old);
                old.borrow_mut().next = Some(new.clone());
            }
            None => {
                self.head = Some(new.clone());
            }
        }

        self.tail = Some(new);
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

        let new = Node::new(value);
        let prev = self.get(index - 1);

        {
            let next = prev.borrow().next.as_ref().cloned().unwrap();
            next.borrow_mut().prev = Rc::downgrade(&new);
            new.borrow_mut().next = Some(next);
        }

        new.borrow_mut().prev = Rc::downgrade(&prev);
        prev.borrow_mut().next = Some(new);

        self.len += 1;
    }

    pub fn pop_front(&mut self) -> Option<T> {
        self.head.take().map(|old| {
            match old.borrow_mut().next.take() {
                Some(new) => {
                    new.borrow_mut().prev = Weak::new();
                    self.head = Some(new);
                }
                None => {
                    self.tail.take();
                }
            }

            self.len -= 1;
            Rc::try_unwrap(old).ok().unwrap().into_inner().value
        })
    }

    pub fn pop_back(&mut self) -> Option<T> {
        self.tail.take().map(|old| {
            match old.borrow_mut().prev.upgrade() {
                Some(new) => {
                    new.borrow_mut().next.take();
                    self.tail = Some(new);
                }
                None => {
                    self.head.take();
                }
            }

            self.len -= 1;
            Rc::try_unwrap(old).ok().unwrap().into_inner().value
        })
    }

    pub fn remove(&mut self, index: usize) -> T {
        assert!(index < self.len);

        if index == 0 {
            return self.pop_front().unwrap();
        }

        if index == self.len - 1 {
            return self.pop_back().unwrap();
        }

        let doomed = self.get(index);
        {
            let mut doomed = doomed.borrow_mut();
            let prev = doomed.prev.upgrade().unwrap();
            let next = doomed.next.take().unwrap();

            next.borrow_mut().prev = Rc::downgrade(&prev);
            prev.borrow_mut().next = Some(next);
        }

        doomed.borrow_mut().next.take();

        self.len -= 1;
        Rc::try_unwrap(doomed).ok().unwrap().into_inner().value
    }

    pub fn front(&self) -> Option<Ref<T>> {
        self.head
            .as_ref()
            .map(|cell| Ref::map(cell.borrow(), |node| &node.value))
    }

    pub fn back(&self) -> Option<Ref<T>> {
        self.tail
            .as_ref()
            .map(|cell| Ref::map(cell.borrow(), |node| &node.value))
    }

    fn get(&self, index: usize) -> Rc<RefCell<Node<T>>> {
        assert!(
            index < self.len,
            "index out of bounds: the len is {} but the index is {}",
            self.len,
            index
        );

        let mut i = 0;
        let mut current = self.head.as_ref().cloned();

        while i < index {
            i += 1;
            current
                .take()
                .map(|node| current = node.borrow().next.as_ref().cloned());
        }

        current.unwrap()
    }
}

impl<T> Default for LinkedList<T> {
    fn default() -> Self {
        Self {
            len: 0,
            head: None,
            tail: None,
        }
    }
}

impl<T> Drop for LinkedList<T> {
    fn drop(&mut self) {
        while self.pop_front().is_some() {}
    }
}

impl<T> IntoIterator for LinkedList<T> {
    type Item = T;
    type IntoIter = IntoIter<T>;

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
    fn front_back() {
        let mut list = LinkedList::new();
        assert!(list.front().is_none());
        assert!(list.back().is_none());

        list.push_front(0);
        list.push_back(1);
        assert_eq!(*list.front().unwrap(), 0);
        assert_eq!(*list.back().unwrap(), 1);

        list.push_front(2);
        list.push_back(3);
        assert_eq!(*list.front().unwrap(), 2);
        assert_eq!(*list.back().unwrap(), 3);

        list.pop_front();
        list.pop_back();
        assert_eq!(*list.front().unwrap(), 0);
        assert_eq!(*list.back().unwrap(), 1);

        list.pop_back();
        assert_eq!(*list.front().unwrap(), 0);
        assert_eq!(*list.back().unwrap(), 0);

        list.pop_back();
        assert!(list.front().is_none());
        assert!(list.back().is_none());
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
        assert_eq!(list.pop_front(), Some(1));
        assert_eq!(list.pop_front(), Some(2));
        assert_eq!(list.pop_front(), None);
    }

    #[test]
    #[should_panic]
    fn remove_out_of_bounds() {
        let mut list = LinkedList::new();
        list.insert(0, 0);
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
        assert_eq!(*list.front().unwrap(), 0);

        list.insert(1, 1);
        list.insert(2, 2);
        assert_eq!(list.remove(1), 1);
        assert_eq!(list.len(), 2);
        assert_eq!(*list.front().unwrap(), 0);
        assert_eq!(*list.back().unwrap(), 2);

        assert_eq!(list.remove(0), 0);
        assert_eq!(list.remove(0), 2);
        assert_eq!(list.len(), 0);
    }
}
