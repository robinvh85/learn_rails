require 'nokogiri'
require 'open-uri'

namespace :log_b do
  desc "Check log_b"

  # rake log_b:check_hl
  task check_hl: :environment do
    puts "RUN: rake log_b:check_hl"
    limit_h = 5250
    limit_l = 4750
    list = LogB.where(amount_h: nil).order(id: 'asc')

    list.each_with_index do |item, index|
      count_h = 0
      count_l = 0
      count_hl = 0
      count_lh = 0

      next if index == 0
      if item.roll >= limit_h && list[index - 1].roll >= limit_h
        count_h = 2
        inc = 2
        while (index - inc >= 0)
          roll = list[index - inc].roll
          if roll >= limit_h
            count_h += 1
          else
            break
          end

          inc += 1
        end
      end

      if item.roll <= limit_l && list[index - 1].roll <= limit_l
        count_l = 2
        inc = 2
        while (index - inc >= 0)
          roll = list[index - inc].roll
          if roll <= limit_l
            count_l += 1
          else
            break
          end

          inc += 1
        end
      end

      if item.roll >= limit_h && list[index - 1].roll <= limit_l
        count = 2
        count_lh = count
        inc = 2
        while (index - inc >= 0)
          roll = list[index - inc].roll
          if roll >= limit_h
            count += 1
            count_hl = count
            count_lh = 0
          else
            count_lh = count
            break
          end

          break if index - (inc + 1) < 0
          roll = list[index - (inc + 1)].roll
          if roll <= limit_l
            count += 1
            count_lh = count
            count_hl = 0
          else
            count_hl = count
            break
          end

          inc += 2
        end
      end

      if item.roll <= limit_l && list[index - 1].roll >= limit_h
        count = 2
        count_hl = 2
        inc = 2
        while (index - inc >= 0)
          roll = list[index - inc].roll
          if roll <= limit_l
            count += 1
            count_hl = 0
            count_lh = count
          else
            break
          end

          break if index - (inc + 1) < 0
          roll = list[index - (inc + 1)].roll
          if roll >= limit_h
            count += 1
            count_lh = 0
            count_hl = count
          else
            break
          end

          inc += 2
        end
      end

      # binding.pry
      item.update!({ amount_h: count_h, amount_l: count_l, amount_hl: count_hl, amount_lh: count_lh })
      puts "Updated: #{item.nonce}"
		end
  end

  # rake log_b:check_dup
  task :check_dup, [:dup] => :environment do |t, args|
    # binding.pry
    puts "RUN: rake log_b:check_dup"
    limit_h = 5250
    limit_l = 4750
    list = LogB.where("nonce > 110530").order(id: 'asc')
    # list = LogB.all.order(id: 'asc')
    # binding.pry
    list.each_with_index do |item, index|
      dup = args[:dup].to_i
      # binding.pry
      next if index <= dup

      # binding.pry
      if item.roll_type == list[index - dup].roll_type
        item["dup_#{dup}"] = list[index - 1]["dup_#{dup}"].to_i + 1
        item.save
      end
    end
  end
end
