; params: satgen 531908 2 1 3 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	image2 - mode
	thermograph1 - mode
	Star1 - direction
	Star2 - direction
	GroundStation0 - direction
	Star3 - direction
	Phenomenon4 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 image2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 image2)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Star3 thermograph1)
	(have_image Phenomenon4 spectrograph0)
))

)
