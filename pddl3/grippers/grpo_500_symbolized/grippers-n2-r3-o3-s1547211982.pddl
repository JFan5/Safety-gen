(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_12 - type_1
obj_05 obj_09 obj_04 obj_10 - type_3
obj_06 obj_08 obj_01 - type_2
obj_02 obj_07 obj_11 - object)
(:init
(pred_3 obj_03 obj_01)
(pred_4 obj_03 obj_05)
(pred_4 obj_03 obj_09)
(pred_3 obj_12 obj_01)
(pred_4 obj_12 obj_04)
(pred_4 obj_12 obj_10)
(pred_2 obj_02 obj_06)
(pred_2 obj_07 obj_01)
(pred_2 obj_11 obj_08)
)
(:goal
(and
(pred_2 obj_02 obj_08)
(pred_2 obj_07 obj_08)
(pred_2 obj_11 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_08)))
)
)