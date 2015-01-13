
facts("Thermostats") do
    context("Berendsen thermostat") do
        sim = testing_simulation()
        add_control(sim, BerendsenThermostat(300, 10))
        create_velocities(sim, 200)

        run!(sim, 1000)
        T_end = T(sim)
        @fact T_end => roughly(300, atol=10)
    end

    context("Velocity rescale thermostat") do
        sim = testing_simulation()
        add_control(sim, VelocityRescaleThermostat(300, 10))
        create_velocities(sim, 200)

        run!(sim, 1000)
        T_end = T(sim)
        @fact T_end => roughly(300, atol=15)
    end
end