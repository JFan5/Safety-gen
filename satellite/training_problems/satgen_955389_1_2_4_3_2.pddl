; params: satgen 955389 1 2 4 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image3 - mode
	spectrograph0 - mode
	image1 - mode
	thermograph2 - mode
	GroundStation1 - direction
	Star2 - direction
	Star0 - direction
	Phenomenon3 - direction
	Planet4 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph2)
	(supports instrument0 image1)
	(supports instrument0 image3)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Phenomenon3 image3)
	(have_image Planet4 spectrograph0)
))

)
