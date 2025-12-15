(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_11 - type_1
obj_10 obj_08 obj_01 obj_02 - type_3
obj_07 obj_14 obj_13 obj_05 - type_2
obj_06 obj_04 obj_09 obj_03 - object)
(:init
(pred_3 obj_12 obj_07)
(pred_4 obj_12 obj_10)
(pred_4 obj_12 obj_08)
(pred_3 obj_11 obj_07)
(pred_4 obj_11 obj_01)
(pred_4 obj_11 obj_02)
(pred_2 obj_06 obj_07)
(pred_2 obj_04 obj_05)
(pred_2 obj_09 obj_07)
(pred_2 obj_03 obj_14)
)
(:goal
(and
(pred_2 obj_06 obj_13)
(pred_2 obj_04 obj_05)
(pred_2 obj_09 obj_07)
(pred_2 obj_03 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_13)))
)
)