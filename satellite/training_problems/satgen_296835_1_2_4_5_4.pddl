; params: satgen 296835 1 2 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image3 - mode
	thermograph2 - mode
	image1 - mode
	spectrograph0 - mode
	Star0 - direction
	Star1 - direction
	Star3 - direction
	GroundStation4 - direction
	Star2 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Phenomenon7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 spectrograph0)
	(supports instrument0 image3)
	(supports instrument0 thermograph2)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon7)
)
(:goal (and
	(pointing satellite0 Phenomenon7)
	(have_image Planet5 image1)
	(have_image Phenomenon6 spectrograph0)
	(have_image Phenomenon7 thermograph2)
	(have_image Star8 image1)
))

)
