; params: satgen 740225 2 3 4 3 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared2 - mode
	infrared0 - mode
	thermograph1 - mode
	spectrograph3 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	Star3 - direction
	Phenomenon4 - direction
	Planet5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument2 infrared2)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite0 Phenomenon8)
	(pointing satellite1 Planet5)
	(have_image Star3 infrared0)
	(have_image Phenomenon4 thermograph1)
	(have_image Planet5 thermograph1)
	(have_image Phenomenon6 spectrograph3)
	(have_image Star7 thermograph1)
	(have_image Phenomenon8 infrared2)
))

)
