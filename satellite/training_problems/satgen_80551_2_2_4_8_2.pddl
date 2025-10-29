; params: satgen 80551 2 2 4 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared1 - mode
	spectrograph3 - mode
	infrared2 - mode
	image0 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	Star2 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 spectrograph3)
	(supports instrument1 image0)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation6)
)
(:goal (and
	(have_image Planet8 image0)
	(have_image Planet9 image0)
))

)
