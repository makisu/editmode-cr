require "spec"
require "webmock"
Spec.before_each &->WebMock.reset
Spec.before_each { Editmode.api_key = "test" }
require "../src/editmode"
