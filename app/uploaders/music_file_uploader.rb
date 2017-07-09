class MusicFileUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    model.name if original_filename
  end

  def public_id
    model.name
  end
end
