(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_03 - type_1
obj_08 obj_11 obj_09 obj_10 - type_2
obj_06 obj_13 obj_14 obj_02 - type_3
obj_07 obj_05 obj_04 obj_12 - object)
(:init
(pred_1 obj_01 obj_14)
(pred_2 obj_01 obj_08)
(pred_2 obj_01 obj_11)
(pred_1 obj_03 obj_14)
(pred_2 obj_03 obj_09)
(pred_2 obj_03 obj_10)
(pred_4 obj_07 obj_06)
(pred_4 obj_05 obj_13)
(pred_4 obj_04 obj_14)
(pred_4 obj_12 obj_13)
)
(:goal
(and
(pred_4 obj_07 obj_06)
(pred_4 obj_05 obj_13)
(pred_4 obj_04 obj_02)
(pred_4 obj_12 obj_14)
)
)

(:constraints
  (always (not (pred_1 obj_01 obj_02)))
)
)