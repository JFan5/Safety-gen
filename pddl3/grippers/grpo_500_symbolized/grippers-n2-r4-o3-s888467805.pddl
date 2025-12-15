(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_07 - type_1
obj_02 obj_13 obj_09 obj_01 - type_3
obj_06 obj_04 obj_05 obj_12 - type_2
obj_11 obj_08 obj_10 - object)
(:init
(pred_3 obj_03 obj_06)
(pred_4 obj_03 obj_02)
(pred_4 obj_03 obj_13)
(pred_3 obj_07 obj_06)
(pred_4 obj_07 obj_09)
(pred_4 obj_07 obj_01)
(pred_2 obj_11 obj_12)
(pred_2 obj_08 obj_12)
(pred_2 obj_10 obj_12)
)
(:goal
(and
(pred_2 obj_11 obj_05)
(pred_2 obj_08 obj_05)
(pred_2 obj_10 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_05)))
)
)