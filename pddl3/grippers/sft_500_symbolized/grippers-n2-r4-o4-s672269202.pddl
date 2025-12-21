(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_04 - type_1
obj_10 obj_03 obj_08 obj_02 - type_2
obj_12 obj_01 obj_05 obj_14 - type_3
obj_06 obj_13 obj_07 obj_09 - object)
(:init
(pred_1 obj_11 obj_05)
(pred_3 obj_11 obj_10)
(pred_3 obj_11 obj_03)
(pred_1 obj_04 obj_12)
(pred_3 obj_04 obj_08)
(pred_3 obj_04 obj_02)
(pred_2 obj_06 obj_01)
(pred_2 obj_13 obj_12)
(pred_2 obj_07 obj_01)
(pred_2 obj_09 obj_14)
)
(:goal
(and
(pred_2 obj_06 obj_05)
(pred_2 obj_13 obj_05)
(pred_2 obj_07 obj_14)
(pred_2 obj_09 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_14)))
)
)