; params: satgen 651198 1 2 4 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	thermograph3 - mode
	spectrograph1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation1 - direction
	Star2 - direction
	Phenomenon3 - direction
	Star4 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph3)
	(supports instrument0 spectrograph0)
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Phenomenon3 spectrograph1)
	(have_image Star4 thermograph3)
))

)
