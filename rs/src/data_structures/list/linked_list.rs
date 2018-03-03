use std::cell::RefCell;
use std::rc::{Rc, Weak};

struct Node<T> {
    value: T,
    next: RefCell<Option<Rc<Node<T>>>>,
    prev: RefCell<Weak<Node<T>>>,
}

pub struct LinkedList<T> {
    len: usize,
    head: Option<Rc<Node<T>>>,
    tail: Option<Rc<Node<T>>>,
}

impl<T> LinkedList<T> {
    pub fn new() -> Self {
        Self {
            len: 0,
            head: None,
            tail: None,
        }
    }

    pub fn len(&self) -> usize {
        self.len
    }

    pub fn is_empty(&self) -> bool {
        self.len == 0
    }

    pub fn push_back(&mut self, value: T) {
        match self.head {
            None => self.push_front(value),
            Some(ref node) => {
                let old = self.tail.take();
                let old = match old.as_ref() {
                    Some(node) => node,
                    None => node,
                };

                let new = Rc::new(Node {
                    value,
                    next: RefCell::new(None),
                    prev: RefCell::new(Rc::downgrade(old)),
                });

                *old.next.borrow_mut() = Some(Rc::clone(&new));

                self.tail = Some(new);
                self.len += 1;
            }
        }
    }

    pub fn pop_back(&mut self) -> Option<T> {
        match self.tail.take() {
            None => self.pop_front(),
            Some(node) => {
                match node.prev.borrow().upgrade() {
                    None => self.head = None,
                    Some(node) => {
                        node.next.replace(None);
                        self.tail = Some(node);
                    }
                };

                self.len -= 1;
                match Rc::try_unwrap(node) {
                    Ok(node) => Some(node.value),
                    _ => panic!(),
                }
            }
        }
    }

    pub fn push_front(&mut self, value: T) {
        let old = self.head.take();
        let new = Rc::new(Node {
            value,
            next: RefCell::new(old.as_ref().cloned()),
            prev: RefCell::new(Weak::new()),
        });

        if let Some(ref node) = old {
            *node.prev.borrow_mut() = Rc::downgrade(&new);
        }

        self.head = Some(new);
        if self.tail.is_none() {
            self.tail = old;
        }

        self.len += 1;
    }

    pub fn pop_front(&mut self) -> Option<T> {
        if self.len == 1 {
            self.tail = None;
        }

        match self.head.take() {
            None => None,
            Some(node) => {
                if let Some(node) = node.next.replace(None) {
                    self.head = Some(node);
                }

                self.len -= 1;
                match Rc::try_unwrap(node) {
                    Ok(node) => Some(node.value),
                    _ => panic!(),
                }
            }
        }
    }

    pub fn insert(&mut self, index: usize, value: T) {
        assert!(index <= self.len);

        if index == 0 {
            return self.push_front(value);
        }

        if index == self.len {
            return self.push_back(value);
        }

        let new = Rc::new(Node {
            value,
            next: RefCell::new(None),
            prev: RefCell::new(Weak::new()),
        });

        let prev = self.get(index - 1);
        {
            let next = prev.next.borrow();
            let next = next.as_ref().cloned().unwrap();
            *next.prev.borrow_mut() = Rc::downgrade(&new);
            *new.next.borrow_mut() = Some(next);
        }

        *prev.next.borrow_mut() = Some(Rc::clone(&new));
        *new.prev.borrow_mut() = Rc::downgrade(&prev);

        self.len += 1;
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
        let prev = doomed.prev.replace(Weak::new()).upgrade().unwrap();
        let next = doomed.next.replace(None).unwrap();

        *next.prev.borrow_mut() = Rc::downgrade(&prev);
        *prev.next.borrow_mut() = Some(next);

        self.len -= 1;
        match Rc::try_unwrap(doomed) {
            Ok(node) => node.value,
            _ => panic!(),
        }
    }

    pub fn front(&self) -> Option<&T> {
        self.head.as_ref().map(|node| &node.value)
    }

    pub fn back(&self) -> Option<&T> {
        match self.tail {
            None => self.front(),
            Some(ref node) => Some(&node.value),
        }
    }

    fn get(&self, index: usize) -> Rc<Node<T>> {
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
            current.take().map(|node| {
                current = node.next.borrow().as_ref().cloned();
            });
        }

        current.unwrap()
    }
}

impl<T> Drop for LinkedList<T> {
    fn drop(&mut self) {
        while self.pop_front().is_some() {}
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
    fn push_back_non_empty() {
        let mut list = LinkedList::new();
        for v in 0..3 {
            list.push_back(v);
        }

        assert_eq!(list.len(), 3);
        assert_eq!(list.is_empty(), false);
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
    fn front_back() {
        let mut list = LinkedList::new();
        assert_eq!(list.front(), None);
        assert_eq!(list.back(), None);

        list.push_front(0);
        list.push_back(1);
        assert_eq!(list.front(), Some(&0));
        assert_eq!(list.back(), Some(&1));

        list.push_front(2);
        list.push_back(3);
        assert_eq!(list.front(), Some(&2));
        assert_eq!(list.back(), Some(&3));

        list.pop_front();
        list.pop_back();
        assert_eq!(list.front(), Some(&0));
        assert_eq!(list.back(), Some(&1));

        list.pop_back();
        assert_eq!(list.front(), Some(&0));
        assert_eq!(list.back(), Some(&0));

        list.pop_back();
        assert_eq!(list.front(), None);
        assert_eq!(list.back(), None);
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
}
