import ast

from django import template

register = template.Library()

@register.filter
def get_type(value):
    return type(value)

@register.filter
def literal_eval(a):
    return ast.literal_eval(a)

@register.simple_tag
def define(val=None):
  return val