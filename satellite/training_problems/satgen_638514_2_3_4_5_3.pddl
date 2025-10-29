; params: satgen 638514 2 3 4 5 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	spectrograph3 - mode
	spectrograph1 - mode
	image2 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation2 - direction
	GroundStation0 - direction
	Star5 - direction
	Star6 - direction
	Phenomenon7 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 thermograph0)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
	(supports instrument1 image2)
	(supports instrument1 spectrograph3)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation0)
	(supports instrument2 spectrograph3)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation0)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite1 GroundStation4)
	(have_image Star5 spectrograph3)
	(have_image Star6 thermograph0)
	(have_image Phenomenon7 image2)
))

)
