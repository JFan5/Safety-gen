; params: satgen 843974 1 1 3 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	image2 - mode
	spectrograph1 - mode
	spectrograph0 - mode
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star5 - direction
	GroundStation6 - direction
	GroundStation0 - direction
	GroundStation7 - direction
	Planet8 - direction
	Star9 - direction
	Star10 - direction
	Planet11 - direction
	Phenomenon12 - direction
	Phenomenon13 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation7)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Planet8 spectrograph1)
	(have_image Star9 spectrograph0)
	(have_image Star10 spectrograph1)
	(have_image Planet11 spectrograph1)
	(have_image Phenomenon12 spectrograph0)
	(have_image Phenomenon13 spectrograph1)
))

)
