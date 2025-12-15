(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_05 - type_1
obj_07 obj_01 obj_03 obj_09 - type_3
obj_11 obj_10 obj_08 obj_02 - type_2
obj_06 obj_12 obj_13 - object)
(:init
(pred_3 obj_04 obj_02)
(pred_4 obj_04 obj_07)
(pred_4 obj_04 obj_01)
(pred_3 obj_05 obj_10)
(pred_4 obj_05 obj_03)
(pred_4 obj_05 obj_09)
(pred_2 obj_06 obj_10)
(pred_2 obj_12 obj_08)
(pred_2 obj_13 obj_11)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_12 obj_10)
(pred_2 obj_13 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_08)))
)
)