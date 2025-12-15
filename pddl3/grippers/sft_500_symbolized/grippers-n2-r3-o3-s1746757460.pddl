(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_12 - type_2
obj_03 obj_01 obj_05 obj_02 - type_1
obj_09 obj_11 obj_08 - type_3
obj_10 obj_07 obj_06 - object)
(:init
(pred_2 obj_04 obj_09)
(pred_1 obj_04 obj_03)
(pred_1 obj_04 obj_01)
(pred_2 obj_12 obj_11)
(pred_1 obj_12 obj_05)
(pred_1 obj_12 obj_02)
(pred_4 obj_10 obj_11)
(pred_4 obj_07 obj_09)
(pred_4 obj_06 obj_09)
)
(:goal
(and
(pred_4 obj_10 obj_09)
(pred_4 obj_07 obj_08)
(pred_4 obj_06 obj_08)
)
)

(:constraints
  (always (not (pred_2 obj_04 obj_08)))
)
)