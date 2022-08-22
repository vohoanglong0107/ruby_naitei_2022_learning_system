require "pagy/extras/bootstrap"
Pagy::DEFAULT[:page] = Settings.pagy.default_page_1
Pagy::DEFAULT[:items] = Settings.pagy.max_courses_per_page_12
