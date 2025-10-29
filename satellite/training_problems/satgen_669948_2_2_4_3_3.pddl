; params: satgen 669948 2 2 4 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	thermograph0 - mode
	thermograph3 - mode
	spectrograph1 - mode
	image2 - mode
	Star0 - direction
	Star2 - direction
	GroundStation1 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 thermograph3)
	(calibration_target instrument0 Star0)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 Star2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
	(supports instrument2 thermograph3)
	(supports instrument2 thermograph0)
	(supports instrument2 spectrograph1)
	(supports instrument2 image2)
	(calibration_target instrument2 GroundStation1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(have_image Phenomenon3 spectrograph1)
	(have_image Phenomenon4 image2)
	(have_image Phenomenon5 image2)
))

)
