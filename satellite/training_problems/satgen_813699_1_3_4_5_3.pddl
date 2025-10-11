; params: satgen 813699 1 3 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared3 - mode
	spectrograph0 - mode
	image2 - mode
	thermograph1 - mode
	GroundStation1 - direction
	Star3 - direction
	GroundStation4 - direction
	Star0 - direction
	Star2 - direction
	Planet5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 infrared3)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star0)
	(supports instrument1 image2)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star3)
)
(:goal (and
	(have_image Planet5 thermograph1)
	(have_image Star6 image2)
	(have_image Phenomenon7 spectrograph0)
))

)
