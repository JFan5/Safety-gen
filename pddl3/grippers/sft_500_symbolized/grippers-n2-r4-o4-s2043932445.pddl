(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_13 - type_2
obj_02 obj_05 obj_03 obj_08 - type_3
obj_10 obj_06 obj_01 obj_09 - type_1
obj_11 obj_04 obj_12 obj_07 - object)
(:init
(pred_3 obj_14 obj_10)
(pred_4 obj_14 obj_02)
(pred_4 obj_14 obj_05)
(pred_3 obj_13 obj_09)
(pred_4 obj_13 obj_03)
(pred_4 obj_13 obj_08)
(pred_1 obj_11 obj_09)
(pred_1 obj_04 obj_10)
(pred_1 obj_12 obj_10)
(pred_1 obj_07 obj_09)
)
(:goal
(and
(pred_1 obj_11 obj_09)
(pred_1 obj_04 obj_01)
(pred_1 obj_12 obj_01)
(pred_1 obj_07 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_14 obj_01)))
)
)