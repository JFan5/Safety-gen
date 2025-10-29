; params: satgen 252527 1 1 2 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	spectrograph1 - mode
	Star0 - direction
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	GroundStation6 - direction
	GroundStation7 - direction
	GroundStation1 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation7)
)
(:goal (and
	(have_image Planet8 spectrograph1)
	(have_image Planet9 spectrograph1)
))

)
