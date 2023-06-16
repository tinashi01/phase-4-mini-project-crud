class SpicesController < ApplicationController
    def index
        render json: Spice.all, status: :ok
    end

    def create
        spice = Spice.create(spice_params)

        if spice
            render json: spice, status: :created
        end
    end

    def updated
        spice = find_spice

        if spice
            spice.update(spice_params)
            
            render json: spice, status: :ok
        else
            no_spice_found
        end
    end

    def destroy
        spice = find_spice
        if spice
            spice.destroy
            head :no_content
        else
            no_spice_found
        end
    end

    private

    def no_spice_found
        render json: {error: "No spice found!", status: :not_found}
    end

    def find_spice
        Spice.find_by(id: spice_params[:id])
        # Spice.find_by(id: params[:id])
    end

    def spice_params
        params.permit(:id, :title, :image, :description, :notes, :rating)
    end
end
