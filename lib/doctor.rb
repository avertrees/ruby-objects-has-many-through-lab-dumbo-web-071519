class Doctor

# - The `Doctor` class needs an instance method, `#appointments`, that iterates
#   through all `Appointment`s and finds those belonging to this doctor.
# - The `Doctor` class needs an instance method, `#patients`, that iterates over
#   that doctor's `Appointment`s and collects the patient that belongs to each
#   `Appointment`s.

    @@all = []

    attr_accessor :name
    
    def initialize(name)
        @name = name
        @@all << self
    end
    
    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end
    
    def appointments
        Appointment.all.select do |appointment|
            appointment.doctor == self
        end
    end

    def patients
        self.appointments.map do |appointment|
            appointment.patient
        end
    end

    def self.all 
        @@all
    end

end