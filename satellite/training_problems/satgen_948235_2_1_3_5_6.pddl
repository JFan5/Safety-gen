; params: satgen 948235 2 1 3 5 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph1 - mode
	spectrograph0 - mode
	image2 - mode
	Star1 - direction
	GroundStation2 - direction
	Star4 - direction
	Star3 - direction
	Star0 - direction
	Phenomenon5 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 image2)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument1 thermograph1)
	(supports instrument1 image2)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star10)
)
(:goal (and
	(have_image Phenomenon5 image2)
	(have_image Star6 thermograph1)
	(have_image Star7 spectrograph0)
	(have_image Planet8 thermograph1)
	(have_image Phenomenon9 spectrograph0)
	(have_image Star10 spectrograph0)
))

)
