class ChemicalsController < ApplicationController
  def index
    @chemicals = ["H2SO4", "HCl", "HNO3"]
  end
end
