class MusicFileUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  def filename
    model.name if original_filename
  end

  def public_id
    model.name
  end
end
