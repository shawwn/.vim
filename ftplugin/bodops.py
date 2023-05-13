import vim
import os
import re
from pathlib import Path

def bodop(line):
  #match = re.match('^\(mac\s+(\S+)\s+(\(.+\.\s+body\)|body)', line)
  #match = re.match('^\((?:def\S*|mac)\s+(\S+)\s+(\(.+(?:rest:|[.])\s+body\)|body)', line)
  #match = re.match('^\((def\S*|mac|macro)\s+(\S+)\s+(\(.+\s+body\)|body)', line)
  # match = re.match('^\(mac\s+(\S+)\s+(\(.+\.\s+body\)|body)', line)
  # match = re.match('^\(define-macro\s+(\S+)\s+(\(.+rest:\s+body\)|body)', line)
  #match = re.match('^\s*\((?:def\S*|\S+-def\S*|mac|var)\s+(\S+)\s+(\(.+(?:rest:|[.])\s+body\)|body)', line)
  #match = re.match(r'^\s*\((?:def\S*|\S+-def\S*|mac|var)\s+(\S+)[^$]*\bbody\b[)]+?$', line, re.M)
  # as of 2021-03-30:
  #match = re.match(r'^\s*\((?:def\S*|\S+-def\S*|mac|var)\s+(\S+)[^$]*[^,@]\bbody\b[)]+?$', line, re.M)
  #match = re.match(r'^\s*\((?:def\S*|\S+-def\S*|mac|var)\s+(\S+)[^;$]*[^;,@]\bbody\b[)]+?$', line, re.M)
  match = re.match(r'^\s*\((?:def\S*|\S+-def\S*|defmac|mac|var)\s+(\S+)(?:([^;$]*[^;,@]\bbody\b([)]+?|$))|(.*;[ ]*indent[ ]body))', line)
  if match:
    if not re.match(r'[;].*indent[ ]fn\b', line):
      return match.groups()[0]

def read_lines(text):
  if isinstance(text, Path):
    text = text.read_text()
  if hasattr(text, 'read'):
    text = text.read()
  return text.splitlines()

def bodops(text):
  for line in read_lines(text):
    if op := bodop(line):
      yield op

# inefficient
# def files(path, patterns, recursive=True):
#   p = Path(path)
#   for pattern in patterns.split(","):
#     yield from (p.rglob if recursive else p.glob)(pattern)

def files(path, patterns, recursive=True, maxdepth=4, depth=0):
  p = Path(path)
  for file in p.iterdir():
    if any([file.match(pattern) for pattern in patterns.split(",")]):
      yield file
    if recursive and depth < maxdepth and file.is_dir():
      yield from files(file, patterns, recursive=recursive, maxdepth=maxdepth, depth=depth+1)

def realpath(path="."):
    return Path(path).expanduser().resolve()

def realdir(path="."):
  if p := realpath(path):
    if not p.is_dir():
      return p.parent
    return p

def at_git_repo(path):
  # Check whether "path/.git" exists and is a directory
  p = realdir(path)
  git_dir = p / ".git"
  if git_dir.is_dir():
    return p

def find_repo(path="."):
    "Find repository root from the path's parents"
    p = realdir(path)
    for path in [p] + list(p.parents):
      if repo := at_git_repo(path):
        return repo

def find_root(path="."):
  p = realpath(path)
  if p.exists():
    return find_repo(p) or p

def lispfiles(path=".", pattern="*.arc,*.scm,*.rkt,*.l,*.lisp,*.el", recursive=True, maxdepth=4):
  if path := find_root(path):
    return files(path, pattern, recursive=recursive, maxdepth=maxdepth)
  return []

def find_bodops(path=".", recursive=True):
  for file in lispfiles(path, recursive=recursive):
    yield from bodops(Path(file))

def bodops_for_buffer(buf=None, recursive=True):
  if buf is None:
    buf = vim.current.buffer
  path = realpath(buf.name)
  for file in lispfiles(path, recursive=recursive):
    if file != path: # skip current buffer's file
      yield from bodops(Path(file))
  text = '\n'.join(list(buf))
  yield from bodops(text)


additional_lispwords = []

def update_lispwords(verbose=False, buf=None):
  if buf is None:
    buf = vim.current.buffer
  for lw in additional_lispwords:
      vim.command('setl lw-=' + lw)
  additional_lispwords.clear()
  for macro in bodops_for_buffer(buf=buf):
    if verbose: print('setl lw+=' + macro)
    vim.command('setl lw+=' + macro)
    additional_lispwords.append(macro)
  if verbose:
    print('-------------')
    print(buf.options["lispwords"].decode('utf-8').split(','))


