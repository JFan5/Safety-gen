; params: satgen 375912 2 1 2 8 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	spectrograph0 - mode
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star4 - direction
	GroundStation0 - direction
	Star8 - direction
	Star9 - direction
	Planet10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation7)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon11)
	(supports instrument1 infrared1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation0)
	(calibration_target instrument1 Star4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star8)
)
(:goal (and
	(have_image Star8 infrared1)
	(have_image Star9 spectrograph0)
	(have_image Planet10 infrared1)
	(have_image Phenomenon11 infrared1)
))

)
