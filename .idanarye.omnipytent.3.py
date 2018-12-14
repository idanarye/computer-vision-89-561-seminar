import vim
import yaml
from omnipytent import *
from omnipytent.ext.idan import *

import re

from plumbum import SshMachine


@task.options
def choose_entry_point(ctx):
    ctx.key(str)
    for source_file in local.path('.').glob('*.m'):
        if source_file.read('utf8').startswith('% entry_point'):
            yield source_file

@task(choose_entry_point)
def choose_configuration(ctx):
    function_name = ctx.dep.choose_entry_point.with_suffix('').basename
    ctx.pass_data(dict(
        entry_point=ctx.dep.choose_entry_point,
        main_call=function_name,
    ))
    # ctx.key(lambda entry: entry['name'])
    # ctx.preview(lambda entry: yaml.dump(entry['args']))
    # for name, args in ctx.dep.choose_ex['configurations'].items():
        # yield dict(
            # name=name,
            # args=args,
            # main_call='main(%s)' % ', '.join(repr(arg) for arg in args))


def _parse_mainfile(ex_dir):
    relevant = []
    for line in (ex_dir / 'main.m').read('utf8').splitlines():
        if line.startswith('% '):
            relevant.append(line[2:])
        elif line.startswith('function main'):
            break
        else:
            return {}
    return yaml.load('\n'.join(relevant))


@task.window
def open_shell(ctx):
    cmd = local['octave']
    shell = cmd & TERMINAL_PANEL
    shell << 'pkg load image;'
    ctx.pass_data(shell)


@task(choose_configuration, open_shell)
def run(ctx):
    # print(ctx.dep.choose_configuration)
    ctx.dep.open_shell << ctx.dep.choose_configuration['main_call']


@task(open_shell)
def help(ctx):
    ctx.dep.open_shell << 'help histShape'
