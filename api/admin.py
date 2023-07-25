from django.contrib import admin
from import_export import resources
from api.models import School
from import_export.admin import ImportExportModelAdmin


class SchoolResource(resources.ModelResource):
    class Meta:
        model = School
        import_id_fields = ['id']


# Register your models here.

class SchoolAdmin(ImportExportModelAdmin):
    search_fields = ['name']
    resource_class = SchoolResource


admin.site.register(School, SchoolAdmin)
