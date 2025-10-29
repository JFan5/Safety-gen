; params: satgen 181067 2 3 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	infrared3 - mode
	spectrograph2 - mode
	thermograph1 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	GroundStation6 - direction
	GroundStation1 - direction
	GroundStation7 - direction
	Star5 - direction
	Phenomenon8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 thermograph1)
	(supports instrument0 infrared3)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star9)
	(supports instrument1 spectrograph2)
	(supports instrument1 spectrograph0)
	(supports instrument1 infrared3)
	(calibration_target instrument1 Star5)
	(supports instrument2 thermograph1)
	(supports instrument2 spectrograph0)
	(supports instrument2 infrared3)
	(calibration_target instrument2 Star5)
	(calibration_target instrument2 GroundStation7)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(have_image Phenomenon8 thermograph1)
	(have_image Star9 spectrograph0)
	(have_image Star10 thermograph1)
))

)
