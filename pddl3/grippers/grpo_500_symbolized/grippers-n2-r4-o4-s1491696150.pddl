(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_07 - type_1
obj_14 obj_06 obj_01 obj_10 - type_3
obj_13 obj_11 obj_05 obj_09 - type_2
obj_08 obj_03 obj_02 obj_12 - object)
(:init
(pred_4 obj_04 obj_11)
(pred_2 obj_04 obj_14)
(pred_2 obj_04 obj_06)
(pred_4 obj_07 obj_13)
(pred_2 obj_07 obj_01)
(pred_2 obj_07 obj_10)
(pred_3 obj_08 obj_05)
(pred_3 obj_03 obj_09)
(pred_3 obj_02 obj_13)
(pred_3 obj_12 obj_09)
)
(:goal
(and
(pred_3 obj_08 obj_09)
(pred_3 obj_03 obj_13)
(pred_3 obj_02 obj_13)
(pred_3 obj_12 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_05)))
)
)