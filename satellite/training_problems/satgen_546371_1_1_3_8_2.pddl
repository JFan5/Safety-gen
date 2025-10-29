; params: satgen 546371 1 1 3 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	thermograph0 - mode
	spectrograph2 - mode
	Star0 - direction
	Star1 - direction
	Star2 - direction
	GroundStation3 - direction
	GroundStation4 - direction
	Star5 - direction
	Star7 - direction
	GroundStation6 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 infrared1)
	(supports instrument0 spectrograph2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
)
(:goal (and
	(pointing satellite0 GroundStation3)
	(have_image Phenomenon8 infrared1)
	(have_image Phenomenon9 infrared1)
))

)
