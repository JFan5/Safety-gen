(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_08 - type_1
obj_10 obj_02 obj_11 obj_14 - type_2
obj_03 obj_06 obj_12 obj_05 - type_3
obj_13 obj_07 obj_01 obj_09 - object)
(:init
(pred_1 obj_04 obj_12)
(pred_3 obj_04 obj_10)
(pred_3 obj_04 obj_02)
(pred_1 obj_08 obj_06)
(pred_3 obj_08 obj_11)
(pred_3 obj_08 obj_14)
(pred_2 obj_13 obj_06)
(pred_2 obj_07 obj_06)
(pred_2 obj_01 obj_12)
(pred_2 obj_09 obj_03)
)
(:goal
(and
(pred_2 obj_13 obj_03)
(pred_2 obj_07 obj_12)
(pred_2 obj_01 obj_05)
(pred_2 obj_09 obj_12)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_05)))
)
)