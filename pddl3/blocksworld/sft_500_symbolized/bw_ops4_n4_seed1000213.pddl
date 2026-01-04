(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_01 obj_02 obj_04 obj_03 )
(:init
(pred_4)
(pred_3 obj_01 obj_03)
(pred_3 obj_02 obj_01)
(pred_5 obj_04)
(pred_3 obj_03 obj_04)
(pred_1 obj_02)
)
(:goal
(and
(pred_3 obj_01 obj_02)
(pred_3 obj_02 obj_03)
(pred_3 obj_03 obj_04))
)

(:constraints
  (sometime-before (pred_3 obj_02 obj_03) (pred_3 obj_01 obj_02))
)
)