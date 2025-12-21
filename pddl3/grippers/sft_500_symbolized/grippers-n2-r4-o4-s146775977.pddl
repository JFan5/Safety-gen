(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_04 - type_1
obj_09 obj_13 obj_14 obj_01 - type_2
obj_02 obj_11 obj_05 obj_10 - type_3
obj_07 obj_03 obj_06 obj_12 - object)
(:init
(pred_1 obj_08 obj_11)
(pred_3 obj_08 obj_09)
(pred_3 obj_08 obj_13)
(pred_1 obj_04 obj_02)
(pred_3 obj_04 obj_14)
(pred_3 obj_04 obj_01)
(pred_2 obj_07 obj_02)
(pred_2 obj_03 obj_10)
(pred_2 obj_06 obj_11)
(pred_2 obj_12 obj_10)
)
(:goal
(and
(pred_2 obj_07 obj_11)
(pred_2 obj_03 obj_05)
(pred_2 obj_06 obj_10)
(pred_2 obj_12 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_05)))
)
)