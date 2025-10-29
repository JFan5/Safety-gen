; params: satgen 840062 2 1 4 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared0 - mode
	infrared1 - mode
	image2 - mode
	spectrograph3 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation4 - direction
	GroundStation3 - direction
	Phenomenon5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 infrared0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation0)
	(supports instrument1 spectrograph3)
	(supports instrument1 infrared1)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet6)
)
(:goal (and
	(pointing satellite1 GroundStation4)
	(have_image Phenomenon5 spectrograph3)
	(have_image Planet6 infrared1)
))

)
