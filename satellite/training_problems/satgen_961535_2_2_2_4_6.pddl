; params: satgen 961535 2 2 2 4 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph0 - mode
	infrared1 - mode
	GroundStation3 - direction
	Star1 - direction
	GroundStation0 - direction
	Star2 - direction
	Planet4 - direction
	Planet5 - direction
	Star6 - direction
	Planet7 - direction
	Planet8 - direction
	Planet9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star2)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Planet4 infrared1)
	(have_image Planet5 infrared1)
	(have_image Star6 infrared1)
	(have_image Planet7 infrared1)
	(have_image Planet8 infrared1)
	(have_image Planet9 spectrograph0)
))

)
