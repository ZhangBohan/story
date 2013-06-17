class FileController < ApplicationController
  def upload
    uploaded_io = params[:file]
    original_filename = uploaded_io.original_filename
    format = original_filename[original_filename.rindex('.'), original_filename.size]
    new_file_name = "#{DateTime.now.to_s}#{format}"
    File.open(Rails.root.join('public', 'uploads', new_file_name), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    respond_to do |format|
      format.json { render json: {:status => 'ok', :name => uploaded_io.original_filename} }
    end
  end
end
