# frozen_string_literal: true
require "spec_helper"

describe WhiteRabbit::Monthly do
  subject(:mod) { WhiteRabbit::Monthly }

  describe '.next_month' do
    it { expect(mod.next_month(2016, 5, 4)).to eq Date.new(2016, 6, 4) }
    it { expect(mod.next_month(2016, 12, 4)).to eq Date.new(2017, 1, 4) }
  end

  describe '.prev_month' do
    it { expect(mod.prev_month(2016, 5, 4)).to eq Date.new(2016, 4, 4) }
    it { expect(mod.prev_month(2016, 1, 4)).to eq Date.new(2015, 12, 4) }
  end

  describe '.beginning_of' do
    it { expect(mod.beginning_of(2016, 3)).to eq Date.new(2016, 3, 1) }
    it do
      expect(mod.beginning_of(2016, 3, closing_date: 20))
        .to eq Date.new(2016, 2, 21)
    end
  end

  describe '.end_of' do
    it { expect(mod.end_of(2016, 2)).to eq Date.new(2016, 2, 29) }
    it do
      expect(mod.end_of(2016, 2, closing_date: 20)) .to eq Date.new(2016, 2, 20)
    end
  end

  describe '.term' do
    it do
      expect(mod.term(2016, 2)).to eq Date.new(2016, 2, 1)..Date.new(2016, 2, 29)
    end
    it do
      expect(mod.term(2016, 3, closing_date: 20))
        .to eq Date.new(2016, 2, 21)..Date.new(2016, 3, 20)
    end
  end

  context 'evaled methods' do
    describe '.first_saturday_of' do
      it { expect(mod.first_saturday_of(2016, 10)).to eq Date.new(2016, 10, 1) }
    end

    describe '.second_friday_of' do
      it { expect(mod.second_friday_of(2016, 9)).to eq Date.new(2016, 9, 9) }
    end

    describe '.third_thursday_of' do
      it { expect(mod.third_thursday_of(2016, 8)).to eq Date.new(2016, 8, 18) }
    end

    describe '.fourth_wednesday_of' do
      it { expect(mod.fourth_wednesday_of(2016, 7)).to eq Date.new(2016, 7, 27) }
    end

    describe '.fifth_sunday_of' do
      it { expect(mod.fifth_sunday_of(2016, 5)).to eq Date.new(2016, 5, 29) }
    end

    describe '.first_monday_of' do
      it { expect(mod.first_monday_of(2016, 4)).to eq Date.new(2016, 4, 4) }
    end

    describe '.second_tuesday_of' do
      it { expect(mod.second_tuesday_of(2016, 3)).to eq Date.new(2016, 3, 8) }
    end
  end
end
