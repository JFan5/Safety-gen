(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_05 - type_1
obj_02 obj_01 obj_13 obj_10 - type_3
obj_08 obj_07 obj_12 obj_09 - type_2
obj_03 obj_14 obj_11 obj_04 - object)
(:init
(pred_3 obj_06 obj_08)
(pred_4 obj_06 obj_02)
(pred_4 obj_06 obj_01)
(pred_3 obj_05 obj_12)
(pred_4 obj_05 obj_13)
(pred_4 obj_05 obj_10)
(pred_2 obj_03 obj_08)
(pred_2 obj_14 obj_08)
(pred_2 obj_11 obj_08)
(pred_2 obj_04 obj_08)
)
(:goal
(and
(pred_2 obj_03 obj_08)
(pred_2 obj_14 obj_12)
(pred_2 obj_11 obj_07)
(pred_2 obj_04 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_12)))
)
)