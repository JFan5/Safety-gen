(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_08 - type_1
obj_07 obj_03 obj_11 obj_06 - type_3
obj_09 obj_01 obj_05 obj_13 - type_2
obj_12 obj_02 obj_10 obj_14 - object)
(:init
(pred_3 obj_04 obj_05)
(pred_4 obj_04 obj_07)
(pred_4 obj_04 obj_03)
(pred_3 obj_08 obj_05)
(pred_4 obj_08 obj_11)
(pred_4 obj_08 obj_06)
(pred_2 obj_12 obj_05)
(pred_2 obj_02 obj_05)
(pred_2 obj_10 obj_01)
(pred_2 obj_14 obj_05)
)
(:goal
(and
(pred_2 obj_12 obj_13)
(pred_2 obj_02 obj_09)
(pred_2 obj_10 obj_05)
(pred_2 obj_14 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_13)))
)
)