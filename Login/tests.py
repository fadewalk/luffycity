from django.test import TestCase

# Create your tests here.
import pymysql


conn = pymysql.Connection()
conn.cursor().connection()