; params: satgen 605893 1 1 2 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	GroundStation5 - direction
	Star2 - direction
	Star7 - direction
	Star8 - direction
	Star9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 GroundStation5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
)
(:goal (and
	(have_image Star7 spectrograph0)
	(have_image Star8 spectrograph1)
	(have_image Star9 spectrograph0)
	(have_image Star10 spectrograph1)
))

)
