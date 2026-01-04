(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_03 - type_1
obj_08 obj_07 obj_11 obj_10 - type_2
obj_01 obj_06 obj_02 obj_04 - type_3
obj_12 obj_09 obj_05 - object)
(:init
(pred_4 obj_13 obj_01)
(pred_3 obj_13 obj_08)
(pred_3 obj_13 obj_07)
(pred_4 obj_03 obj_01)
(pred_3 obj_03 obj_11)
(pred_3 obj_03 obj_10)
(pred_1 obj_12 obj_06)
(pred_1 obj_09 obj_06)
(pred_1 obj_05 obj_02)
)
(:goal
(and
(pred_1 obj_12 obj_04)
(pred_1 obj_09 obj_06)
(pred_1 obj_05 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_13 obj_02)))
)
)