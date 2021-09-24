# `refactor`

This is a tool that was used to restructure the solutions that were imported from
a previous repository.

The structure and style used in the previous repository was only slightly different,
but there were too many files to edit by hand.

I used the [`parser`][0] gem to modify the old code in an automated way.
This code contains those modifications.

## Contents

```
./
├── main.rb            # entrypoint
├── code_structure.rb  # code for bulk modifying content of files
└── file_structure.rb  # code for bulk modifying name and location of files
```


[0]: https://rubygems.org/gems/parser
