class Patient

# **The `Patient` model:**


# - The `Patient` class needs an instance method, `#new_appointment`, that takes in
#   an argument of a doctor and a date and creates a new `Appointment`. The
#   `Appointment` should know that it belongs to the patient.
# - The `Patient` class needs an instance method, `#appointments`, that iterates
#   through the `Appointment`s array and returns `Appointment`s that belong to the
#   patient.
# - The `Patient` class needs an instance method, `#doctors`, that iterates over
#   that patient's `Appointment`s and collects the doctor that belongs to each
#   `Appointment`.

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def new_appointment(doctor, date)
        Appointment.new(date,self,doctor)
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.patient == self
        end
    end

    def doctors 
        self.appointments.map do |appointment|
            appointment.doctor
        end
    end
    
    def self.all 
        @@all
    end

end