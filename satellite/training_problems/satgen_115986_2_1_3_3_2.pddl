; params: satgen 115986 2 1 3 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image2 - mode
	spectrograph0 - mode
	thermograph1 - mode
	Star0 - direction
	Star2 - direction
	GroundStation1 - direction
	Phenomenon3 - direction
	Star4 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph0)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite1 GroundStation1)
	(have_image Phenomenon3 image2)
	(have_image Star4 spectrograph0)
))

)
