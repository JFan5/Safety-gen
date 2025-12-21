(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_13 - type_1
obj_09 obj_03 obj_06 obj_02 - type_3
obj_05 obj_08 obj_14 obj_01 - type_2
obj_12 obj_07 obj_11 obj_10 - object)
(:init
(pred_4 obj_04 obj_05)
(pred_2 obj_04 obj_09)
(pred_2 obj_04 obj_03)
(pred_4 obj_13 obj_08)
(pred_2 obj_13 obj_06)
(pred_2 obj_13 obj_02)
(pred_3 obj_12 obj_14)
(pred_3 obj_07 obj_05)
(pred_3 obj_11 obj_05)
(pred_3 obj_10 obj_05)
)
(:goal
(and
(pred_3 obj_12 obj_14)
(pred_3 obj_07 obj_01)
(pred_3 obj_11 obj_14)
(pred_3 obj_10 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_14)))
)
)