; params: satgen 195999 1 2 4 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	infrared2 - mode
	thermograph3 - mode
	spectrograph0 - mode
	image1 - mode
	Star2 - direction
	Star3 - direction
	Star0 - direction
	GroundStation1 - direction
	Star4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 Star0)
	(supports instrument1 infrared2)
	(supports instrument1 spectrograph0)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(pointing satellite0 Star0)
	(have_image Star4 image1)
	(have_image Planet5 thermograph3)
))

)
