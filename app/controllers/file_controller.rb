class FileController < ApplicationController
  def upload
    uploaded_io = params[:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    respond_to do |format|
      format.json { render json: uploaded_io.original_filename }
    end
  end
end
