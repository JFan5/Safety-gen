(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_07 - type_1
obj_01 obj_05 obj_02 obj_08 - type_3
obj_06 obj_09 obj_04 obj_10 - type_2
obj_03 obj_13 obj_12 - object)
(:init
(pred_3 obj_11 obj_04)
(pred_1 obj_11 obj_01)
(pred_1 obj_11 obj_05)
(pred_3 obj_07 obj_06)
(pred_1 obj_07 obj_02)
(pred_1 obj_07 obj_08)
(pred_2 obj_03 obj_04)
(pred_2 obj_13 obj_06)
(pred_2 obj_12 obj_06)
)
(:goal
(and
(pred_2 obj_03 obj_10)
(pred_2 obj_13 obj_10)
(pred_2 obj_12 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_10)))
)
)