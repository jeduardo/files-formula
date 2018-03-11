=============
files-formula
=============

A simple saltstack formula designed to aid in deploying bits of configuration and managed files into hosts managed by Salt.

This can be used to ensure that essential files that either complement existing formulas or need to be present in certain hosts can be deployed without the need for specific formulas to be written just for them.

The formula offers a way to call the individual file states offered by Salt (managed, append, blockreplace, directory, symlink, etc) and add any parameters required by these states.

.. image:: https://travis-ci.org/jeduardo/files-formula.svg?branch=master
    :target: https://travis-ci.org/jeduardo/files-formula

Available states
================

.. contents::
    :local:

``init``
--------

Iterate through the package pillar applying the desired states to the managed files specified in the pillar.