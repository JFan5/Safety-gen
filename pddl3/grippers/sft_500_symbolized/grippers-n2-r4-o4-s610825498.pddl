(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_04 - type_2
obj_06 obj_02 obj_09 obj_10 - type_1
obj_13 obj_12 obj_01 obj_05 - type_3
obj_14 obj_03 obj_08 obj_07 - object)
(:init
(pred_4 obj_11 obj_12)
(pred_3 obj_11 obj_06)
(pred_3 obj_11 obj_02)
(pred_4 obj_04 obj_01)
(pred_3 obj_04 obj_09)
(pred_3 obj_04 obj_10)
(pred_2 obj_14 obj_13)
(pred_2 obj_03 obj_01)
(pred_2 obj_08 obj_13)
(pred_2 obj_07 obj_05)
)
(:goal
(and
(pred_2 obj_14 obj_13)
(pred_2 obj_03 obj_12)
(pred_2 obj_08 obj_01)
(pred_2 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_01)))
)
)