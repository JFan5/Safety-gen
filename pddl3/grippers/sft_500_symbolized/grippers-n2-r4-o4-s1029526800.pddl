(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_08 - type_2
obj_12 obj_10 obj_13 obj_03 - type_3
obj_07 obj_14 obj_06 obj_02 - type_1
obj_09 obj_04 obj_01 obj_11 - object)
(:init
(pred_3 obj_05 obj_06)
(pred_4 obj_05 obj_12)
(pred_4 obj_05 obj_10)
(pred_3 obj_08 obj_02)
(pred_4 obj_08 obj_13)
(pred_4 obj_08 obj_03)
(pred_1 obj_09 obj_02)
(pred_1 obj_04 obj_06)
(pred_1 obj_01 obj_02)
(pred_1 obj_11 obj_02)
)
(:goal
(and
(pred_1 obj_09 obj_14)
(pred_1 obj_04 obj_06)
(pred_1 obj_01 obj_06)
(pred_1 obj_11 obj_14)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_02)))
)
)