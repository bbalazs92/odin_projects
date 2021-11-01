#require 'spec_helper'
require_relative '../lib/caesar_cipher'

describe "caesar_cipher" do

    it "returns a single character: d shifted by -2" do
        expect(caesar_cipher("d", -2)).to eql("b")
    end

    it "returns \"watch for CASES\" shifted by 4 and case sensitive" do
        expect(caesar_cipher("watch for CASES", 4)).to eql("aexgl jsv GEWIW")
    end

end