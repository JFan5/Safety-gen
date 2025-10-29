; params: satgen 383685 2 3 4 4 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	image1 - mode
	spectrograph3 - mode
	thermograph0 - mode
	thermograph2 - mode
	Star3 - direction
	Star2 - direction
	GroundStation1 - direction
	Star0 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph3)
	(supports instrument0 image1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 thermograph0)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 GroundStation1)
	(supports instrument2 spectrograph3)
	(supports instrument2 thermograph2)
	(calibration_target instrument2 Star0)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon4)
)
(:goal (and
	(pointing satellite0 GroundStation1)
	(pointing satellite1 Star0)
	(have_image Phenomenon4 spectrograph3)
	(have_image Phenomenon5 spectrograph3)
))

)
