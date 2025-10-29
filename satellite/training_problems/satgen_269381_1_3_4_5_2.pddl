; params: satgen 269381 1 3 4 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph3 - mode
	infrared2 - mode
	infrared1 - mode
	spectrograph0 - mode
	Star0 - direction
	Star2 - direction
	Star3 - direction
	GroundStation4 - direction
	Star1 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared2)
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph3)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
)
(:goal (and
	(have_image Phenomenon5 infrared1)
	(have_image Phenomenon6 spectrograph0)
))

)
