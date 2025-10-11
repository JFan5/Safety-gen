; params: satgen 915895 2 1 4 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	thermograph1 - mode
	spectrograph2 - mode
	image3 - mode
	Star0 - direction
	GroundStation1 - direction
	Star2 - direction
	GroundStation5 - direction
	Star6 - direction
	Star3 - direction
	GroundStation4 - direction
	Star7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Star11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star11)
)
(:goal (and
	(have_image Star7 spectrograph2)
	(have_image Star8 image3)
	(have_image Phenomenon9 thermograph1)
	(have_image Star10 image3)
	(have_image Star11 thermograph1)
	(have_image Planet12 image3)
))

)
