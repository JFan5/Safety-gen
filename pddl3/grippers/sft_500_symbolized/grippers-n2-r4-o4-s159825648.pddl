(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_14 - type_1
obj_06 obj_03 obj_04 obj_05 - type_2
obj_01 obj_11 obj_08 obj_02 - type_3
obj_07 obj_12 obj_13 obj_09 - object)
(:init
(pred_4 obj_10 obj_08)
(pred_1 obj_10 obj_06)
(pred_1 obj_10 obj_03)
(pred_4 obj_14 obj_02)
(pred_1 obj_14 obj_04)
(pred_1 obj_14 obj_05)
(pred_2 obj_07 obj_01)
(pred_2 obj_12 obj_02)
(pred_2 obj_13 obj_11)
(pred_2 obj_09 obj_02)
)
(:goal
(and
(pred_2 obj_07 obj_02)
(pred_2 obj_12 obj_02)
(pred_2 obj_13 obj_01)
(pred_2 obj_09 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_02)))
)
)