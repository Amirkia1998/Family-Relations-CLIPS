# Family Tree in CLIPS

## Overview

The Family Tree in CLIPS project is a basic implementation of a family tree using CLIPS, a popular rule-based expert system language. It defines templates for people, facts to represent individuals and their relationships, and rules to query and extract information about the family members.

![img](https://github.com/Amirkia1998/Family-Relations-CLIPS/blob/main/Family-Relations/Family-tree.png)

## Templates

The project defines a single template, `person`, with the following slots:
- `name`: Represents the name of the person.
- `age`: Represents the age of the person (integer type).
- `gender`: Represents the gender of the person (allowed values: male, female, other).
- `children`: A multislot that contains the names of the person's children.

## Facts

Facts are used to represent individuals within the family tree. Each `person` fact represents a family member with their attributes.

## Rules

The project includes several rules to perform specific queries on the family tree:
- `count-children`: Counts the number of children for each person in the family.
- `mother`: Identifies individuals who are mothers based on their gender and having at least one child.
- `father`: Identifies individuals who are fathers based on their gender and having at least one child.
- `first-child`: Finds the first child of each person.
- `no-child`: Identifies individuals who have no children.

## Usage

To use this project, you can load it into the CLIPS environment and execute the provided rules to query the family tree. You can also modify the `deffacts init` section to define your own family tree structure.


