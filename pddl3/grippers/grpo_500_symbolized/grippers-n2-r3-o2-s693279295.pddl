(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_08 obj_03 - type_1
obj_01 obj_02 obj_10 obj_05 - type_3
obj_04 obj_11 obj_07 - type_2
obj_06 obj_09 - object)
(:init
(pred_4 obj_08 obj_07)
(pred_2 obj_08 obj_01)
(pred_2 obj_08 obj_02)
(pred_4 obj_03 obj_07)
(pred_2 obj_03 obj_10)
(pred_2 obj_03 obj_05)
(pred_3 obj_06 obj_11)
(pred_3 obj_09 obj_07)
)
(:goal
(and
(pred_3 obj_06 obj_11)
(pred_3 obj_09 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_11)))
)
)