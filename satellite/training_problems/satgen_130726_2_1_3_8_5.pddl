; params: satgen 130726 2 1 3 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	spectrograph0 - mode
	thermograph2 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	GroundStation4 - direction
	GroundStation2 - direction
	GroundStation5 - direction
	Phenomenon8 - direction
	Star9 - direction
	Planet10 - direction
	Star11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation2)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation6)
	(supports instrument1 thermograph2)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation7)
)
(:goal (and
	(pointing satellite0 GroundStation7)
	(have_image Phenomenon8 spectrograph1)
	(have_image Star9 thermograph2)
	(have_image Planet10 spectrograph1)
	(have_image Star11 thermograph2)
	(have_image Phenomenon12 spectrograph1)
))

)
