; params: satgen 873800 2 2 2 7 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	infrared0 - mode
	Star3 - direction
	Star4 - direction
	Star6 - direction
	GroundStation2 - direction
	Star1 - direction
	Star0 - direction
	Star5 - direction
	Phenomenon7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Planet11 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star1)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet11)
	(supports instrument1 infrared0)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star5)
	(calibration_target instrument1 Star0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon9)
)
(:goal (and
	(pointing satellite0 Phenomenon7)
	(have_image Phenomenon7 infrared0)
	(have_image Planet8 spectrograph1)
	(have_image Phenomenon9 infrared0)
	(have_image Star10 spectrograph1)
	(have_image Planet11 spectrograph1)
))

)
