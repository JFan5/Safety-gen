(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_14 - type_1
obj_10 obj_06 obj_11 obj_01 - type_2
obj_13 obj_08 obj_04 obj_02 - type_3
obj_09 obj_12 obj_03 obj_07 - object)
(:init
(pred_1 obj_05 obj_04)
(pred_3 obj_05 obj_10)
(pred_3 obj_05 obj_06)
(pred_1 obj_14 obj_04)
(pred_3 obj_14 obj_11)
(pred_3 obj_14 obj_01)
(pred_2 obj_09 obj_04)
(pred_2 obj_12 obj_13)
(pred_2 obj_03 obj_02)
(pred_2 obj_07 obj_13)
)
(:goal
(and
(pred_2 obj_09 obj_08)
(pred_2 obj_12 obj_02)
(pred_2 obj_03 obj_13)
(pred_2 obj_07 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_02)))
)
)