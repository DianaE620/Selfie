class PhotoUploader < CarrierWave::Uploader::Base
  # ...
  include CarrierWave::MiniMagick

  # Que tipo de strorage usará este uploader
  def store_dir
    # Como y donde guardar el archivo ...
    'photos'
  end

  storage :file

  # Versiones del archivo ...
  process resize_to_fit: [800, 800]

  version :thumb do
    process resize_to_fill: [400,400]
  end


  #Que extensiones vas a aceptar
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end