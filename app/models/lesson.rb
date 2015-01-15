class Lesson < ActiveRecord::Base
	belongs_to :project
	mount_uploader :pdf, PdfUploader
end
