; params: satgen 17238 1 1 4 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	infrared2 - mode
	infrared0 - mode
	spectrograph3 - mode
	Star1 - direction
	Star2 - direction
	GroundStation0 - direction
	Planet3 - direction
	Planet4 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Planet3 infrared2)
	(have_image Planet4 infrared1)
))

)
