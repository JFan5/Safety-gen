(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_09 - type_3
obj_06 obj_12 obj_10 obj_03 - type_2
obj_08 obj_01 obj_02 obj_07 - type_1
obj_13 obj_04 obj_11 - object)
(:init
(pred_1 obj_05 obj_08)
(pred_4 obj_05 obj_06)
(pred_4 obj_05 obj_12)
(pred_1 obj_09 obj_02)
(pred_4 obj_09 obj_10)
(pred_4 obj_09 obj_03)
(pred_2 obj_13 obj_01)
(pred_2 obj_04 obj_08)
(pred_2 obj_11 obj_02)
)
(:goal
(and
(pred_2 obj_13 obj_07)
(pred_2 obj_04 obj_02)
(pred_2 obj_11 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_02)))
)
)