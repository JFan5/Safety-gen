; params: satgen 475735 1 3 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	infrared3 - mode
	image0 - mode
	infrared1 - mode
	spectrograph2 - mode
	Star3 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	Star2 - direction
	Star7 - direction
	Star1 - direction
	GroundStation0 - direction
	GroundStation5 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 spectrograph2)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star7)
	(calibration_target instrument0 Star2)
	(supports instrument1 infrared1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 GroundStation0)
	(calibration_target instrument1 Star1)
	(supports instrument2 infrared1)
	(supports instrument2 image0)
	(supports instrument2 infrared3)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
)
(:goal (and
	(pointing satellite0 Phenomenon10)
	(have_image Phenomenon8 infrared3)
	(have_image Phenomenon9 image0)
	(have_image Phenomenon10 infrared1)
))

)
