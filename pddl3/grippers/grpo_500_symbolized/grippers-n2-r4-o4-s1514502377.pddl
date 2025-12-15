(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_1
obj_06 obj_04 obj_09 obj_07 - type_3
obj_12 obj_02 obj_13 obj_01 - type_2
obj_05 obj_14 obj_11 obj_08 - object)
(:init
(pred_3 obj_10 obj_12)
(pred_4 obj_10 obj_06)
(pred_4 obj_10 obj_04)
(pred_3 obj_03 obj_12)
(pred_4 obj_03 obj_09)
(pred_4 obj_03 obj_07)
(pred_2 obj_05 obj_01)
(pred_2 obj_14 obj_01)
(pred_2 obj_11 obj_13)
(pred_2 obj_08 obj_12)
)
(:goal
(and
(pred_2 obj_05 obj_02)
(pred_2 obj_14 obj_13)
(pred_2 obj_11 obj_12)
(pred_2 obj_08 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_13)))
)
)