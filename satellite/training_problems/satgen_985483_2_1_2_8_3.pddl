; params: satgen 985483 2 1 2 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	infrared0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	Star5 - direction
	GroundStation7 - direction
	GroundStation2 - direction
	Star6 - direction
	Star4 - direction
	Planet8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 infrared0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star6)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 infrared0)
	(calibration_target instrument1 Star4)
	(calibration_target instrument1 Star6)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite0 Star5)
	(pointing satellite1 Star10)
	(have_image Planet8 spectrograph1)
	(have_image Star9 infrared0)
	(have_image Star10 infrared0)
))

)
