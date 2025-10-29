; params: satgen 37934 2 3 2 5 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star1 - direction
	GroundStation3 - direction
	Star5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument2 thermograph0)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation3)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon8)
)
(:goal (and
	(pointing satellite1 GroundStation4)
	(have_image Star5 spectrograph1)
	(have_image Phenomenon6 thermograph0)
	(have_image Planet7 spectrograph1)
	(have_image Phenomenon8 thermograph0)
	(have_image Star9 thermograph0)
))

)
