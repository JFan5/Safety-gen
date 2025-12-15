(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_07 - type_1
obj_11 obj_12 obj_06 obj_04 - type_3
obj_13 obj_01 obj_02 obj_05 - type_2
obj_10 obj_03 obj_09 - object)
(:init
(pred_3 obj_08 obj_13)
(pred_4 obj_08 obj_11)
(pred_4 obj_08 obj_12)
(pred_3 obj_07 obj_13)
(pred_4 obj_07 obj_06)
(pred_4 obj_07 obj_04)
(pred_2 obj_10 obj_02)
(pred_2 obj_03 obj_01)
(pred_2 obj_09 obj_13)
)
(:goal
(and
(pred_2 obj_10 obj_02)
(pred_2 obj_03 obj_13)
(pred_2 obj_09 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_02)))
)
)