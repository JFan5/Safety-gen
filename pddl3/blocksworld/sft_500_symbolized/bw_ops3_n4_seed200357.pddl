(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_04 obj_02 obj_03 obj_01 )
(:init
(pred_4)
(pred_2 obj_04)
(pred_5 obj_02 obj_01)
(pred_2 obj_03)
(pred_5 obj_01 obj_04)
(pred_3 obj_02)
(pred_3 obj_03)
)
(:goal
(and
(pred_5 obj_04 obj_02)
(pred_5 obj_02 obj_03)
(pred_2 obj_03)
(pred_5 obj_01 obj_04))
)

(:constraints
  (sometime-before (pred_5 obj_02 obj_03) (pred_5 obj_04 obj_02))
)
)