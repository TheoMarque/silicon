local util = require("__bzsilicon__.util");

if not mods["Krastorio2"] then
  util.remove_ingredient("concrete", "stone-brick");
  if mods["Bio_Industries"] or mods["omnimatter"] then
    util.add_ingredient("concrete", "stone-brick", 3);
    util.add_ingredient("concrete", "silica", 10);
  else 
    util.add_ingredient("concrete", "silica", 25);
  end
  util.add_prerequisite("concrete", "silica-processing")

  if util.more_intermediates() then 
    util.replace_some_ingredient("processing-unit", "electronic-circuit", 10, "silicon-wafer", 3)

    util.multiply_recipe("effectivity-module", 2)
    util.remove_ingredient("effectivity-module", "electronic-circuit")
    util.add_ingredient("effectivity-module", "silicon-wafer", 3)

    util.multiply_recipe("productivity-module", 2)
    util.remove_ingredient("productivity-module", "electronic-circuit")
    util.add_ingredient("productivity-module", "silicon-wafer", 3)

    util.multiply_recipe("speed-module", 2)
    util.remove_ingredient("speed-module", "electronic-circuit")
    util.add_ingredient("speed-module", "silicon-wafer", 3)

    util.replace_ingredient("solar-panel", "electronic-circuit", "solar-cell")
    util.replace_ingredient("solar-panel-equipment", "solar-panel", "solar-cell")
    util.add_effect("solar-energy", {type = "unlock-recipe", recipe="solar-cell"})


    util.multiply_recipe("advanced-circuit", 3)
    util.replace_some_ingredient("advanced-circuit", "electronic-circuit", 3, "silicon-wafer", 1)
    util.add_prerequisite("advanced-electronics", util.silicon_processing)

  else
    util.replace_some_ingredient("solar-panel", "electronic-circuit", 10, "silicon", 10)

    util.replace_some_ingredient("processing-unit", "electronic-circuit", 10, "silicon", 6)

    util.remove_ingredient("effectivity-module", "electronic-circuit")
    util.add_ingredient("effectivity-module", "silicon", 3)
    util.remove_ingredient("productivity-module", "electronic-circuit")
    util.add_ingredient("productivity-module", "silicon", 3)
    util.remove_ingredient("speed-module", "electronic-circuit")
    util.add_ingredient("speed-module", "silicon", 3)

    util.add_prerequisite("advanced-electronics-2", util.silicon_processing)
  end

  util.add_prerequisite("solar-energy", "silicon-processing")
  util.add_prerequisite("modules", util.silicon_processing)
else
  util.add_ingredient("concrete", "silica", 15);
  if not mods["aai-industry"] then
    util.add_ingredient("concrete", "sand", 10);
  end
end

util.replace_ingredient("beacon", "copper-cable", "optical-fiber")
util.add_prerequisite("effect-transmission", "fiber-optics")

-- Circuit network changes
local useful_combinators = {"timer-combinator", "counting-combinator", "random-combinator",
  "power-combinator", "max-combinator", "min-combinator", "and-gate-combinator",
  "nand-gate-combinator", "nor-gate-combinator", "not-gate-combinator", "or-gate-combinator",
  "xnor-gate-combinator", "xor-gate-combinator", "converter-combinator", "detector-combinator",
  "sensor-combinator", "railway-combinator", "color-combinator", "daytime-combinator",
 "statistic-combinator", "pollution-combinator", "emitter-combinator", "receiver-combinator"}

util.replace_ingredient("green-wire", "copper-cable", "optical-fiber")
util.replace_ingredient("green-wire", "electronic-circuit", "silicon")
util.replace_ingredient("red-wire", "copper-cable", "optical-fiber")
util.replace_ingredient("red-wire", "electronic-circuit", "silicon")

if not mods["IndustrialRevolution"] then
  util.add_ingredient("arithmetic-combinator", "silicon", 1)
  util.add_ingredient("constant-combinator", "silicon", 1)
  util.add_ingredient("decider-combinator", "silicon", 1)
  util.add_ingredient("programmable-speaker", "silicon", 1)
  if mods["UsefulCombinators"] then
    for i, v in ipairs(useful_combinators) do
      util.add_ingredient(v, "silicon", 1)
    end
  end
  if mods["crafting_combinator"] then
    util.add_ingredient("crafting_combinator:crafting-combinator", "silicon", 1)
    util.add_ingredient("crafting_combinator:recipe-combinator", "silicon", 1)
  end
  util.add_ingredient("clock-combinator", "silicon", 1)
  util.add_ingredient("power-meter-combinator", "silicon", 1)
  util.add_ingredient("ghost-scanner", "silicon", 1)
  util.add_ingredient("item-sensor", "silicon", 1)
else
  util.add_prerequisite("circuit-network", "fiber-optics")
end

util.add_ingredient("arithmetic-combinator", "optical-fiber", 1)
util.add_ingredient("constant-combinator", "optical-fiber", 1)
util.add_ingredient("decider-combinator", "optical-fiber", 1)
util.add_ingredient("programmable-speaker", "optical-fiber", 1)
if mods["UsefulCombinators"] then
  for i, v in ipairs(useful_combinators) do
    util.add_ingredient(v, "optical-fiber", 1)
  end
end
if mods["crafting_combinator"] then
  util.add_ingredient("crafting_combinator:crafting-combinator", "optical-fiber", 1)
  util.add_ingredient("crafting_combinator:recipe-combinator", "optical-fiber", 1)
end
util.add_ingredient("clock-combinator", "optical-fiber", 1)
util.add_ingredient("power-meter-combinator", "optical-fiber", 1)
util.add_ingredient("ghost-scanner", "optical-fiber", 1)
util.add_ingredient("item-sensor", "optical-fiber", 1)

util.add_prerequisite("circuit-network", "fiber-optics")
util.add_prerequisite("circuit-network", util.silicon_processing)

if mods["Krastorio2"] then
  util.add_ingredient("biusart-lab", "optical-fiber", 10)
  util.add_ingredient("ai-core", "optical-fiber", 2)

  util.add_prerequisite(util.silicon_processing, "silica-processing")

  if util.more_intermediates() then 
    util.add_effect(util.silicon_processing, {type = "unlock-recipe", recipe="silicon-wafer"})
    util.remove_ingredient("electronic-components", "silicon")
    util.add_ingredient("electronic-components", "silicon-wafer", 1)

    util.replace_ingredient("solar-panel", "electronic-circuit", "solar-cell")
    util.remove_ingredient("solar-panel", "silicon")
    util.replace_ingredient("solar-panel-equipment", "solar-panel", "solar-cell")
    util.add_effect("solar-energy", {type = "unlock-recipe", recipe="solar-cell"})
  end
end

if mods["aai-signal-transimission"] then
  util.add_ingredient("aai-signal-receiver", "optical-fiber", 2)
  util.add_ingredient("aai-signal-sender", "optical-fiber", 2)
end
if mods["aai-industry"] then
  util.add_ingredient("beacon", "optical-fiber", 10)
end

if mods["space-exploration"] then
  util.add_ingredient("se-space-astrometrics-laboratory", "optical-fiber", 10)
  util.add_ingredient("se-space-gravimetrics-laboratory", "optical-fiber", 10)
  util.add_ingredient("se-space-laser-laboratory", "optical-fiber", 10)
  util.add_ingredient("se-space-science-lab", "optical-fiber", 10)
  util.add_ingredient("se-space-supercomputer-1", "optical-fiber", 100)
  util.add_ingredient("se-space-supercomputer-2", "optical-fiber", 500)

  util.add_ingredient("se-polarisation-data", "optical-fiber", 1)

  util.add_ingredient("se-chemical-gel", "silica", 10)
  util.add_ingredient("se-material-testing-pack", "silica", 1)
end



if mods["extended-research-system"] and mods["Bio_Industries"] then
  data:extend({{
      type = "recipe",
      name = "bi-stone-crusher-ers",
      category = "crafting",
      enabled = true,
      energy_required = 6,
      ingredients = {{"iron-plate", 100}, {"iron-gear-wheel", 5}},
      result = "bi-stone-crusher",
    }})
  if data.raw.recipe["bi-crushed-stone-1"] then
    data.raw.recipe["bi-crushed-stone-1"].enabled = true
  end
end
