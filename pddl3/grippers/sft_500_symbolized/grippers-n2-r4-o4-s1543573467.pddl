(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_07 - type_1
obj_10 obj_14 obj_06 obj_08 - type_2
obj_04 obj_01 obj_02 obj_13 - type_3
obj_03 obj_05 obj_11 obj_09 - object)
(:init
(pred_1 obj_12 obj_01)
(pred_3 obj_12 obj_10)
(pred_3 obj_12 obj_14)
(pred_1 obj_07 obj_04)
(pred_3 obj_07 obj_06)
(pred_3 obj_07 obj_08)
(pred_2 obj_03 obj_01)
(pred_2 obj_05 obj_13)
(pred_2 obj_11 obj_13)
(pred_2 obj_09 obj_01)
)
(:goal
(and
(pred_2 obj_03 obj_02)
(pred_2 obj_05 obj_04)
(pred_2 obj_11 obj_01)
(pred_2 obj_09 obj_13)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_02)))
)
)