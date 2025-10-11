; params: satgen 28248 1 2 3 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	infrared2 - mode
	spectrograph1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star4 - direction
	Star6 - direction
	GroundStation7 - direction
	GroundStation3 - direction
	Star2 - direction
	Star5 - direction
	Phenomenon8 - direction
	Star9 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 GroundStation3)
	(supports instrument1 thermograph0)
	(supports instrument1 infrared2)
	(calibration_target instrument1 Star5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
)
(:goal (and
	(have_image Phenomenon8 spectrograph1)
	(have_image Star9 spectrograph1)
))

)
