(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_10 - type_1
obj_13 obj_01 obj_02 obj_04 - type_3
obj_09 obj_05 obj_07 obj_12 - type_2
obj_11 obj_03 obj_06 - object)
(:init
(pred_4 obj_08 obj_07)
(pred_2 obj_08 obj_13)
(pred_2 obj_08 obj_01)
(pred_4 obj_10 obj_05)
(pred_2 obj_10 obj_02)
(pred_2 obj_10 obj_04)
(pred_3 obj_11 obj_07)
(pred_3 obj_03 obj_07)
(pred_3 obj_06 obj_07)
)
(:goal
(and
(pred_3 obj_11 obj_12)
(pred_3 obj_03 obj_07)
(pred_3 obj_06 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_12)))
)
)