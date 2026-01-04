(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_01 obj_04 obj_02 obj_03 )
(:init
(pred_1)
(pred_4 obj_01 obj_03)
(pred_4 obj_04 obj_02)
(pred_2 obj_02)
(pred_4 obj_03 obj_04)
(pred_3 obj_01)
)
(:goal
(and
(pred_4 obj_01 obj_04)
(pred_4 obj_02 obj_03)
(pred_4 obj_03 obj_01))
)

(:constraints
  (sometime-before (pred_4 obj_02 obj_03) (pred_4 obj_01 obj_04))
)
)