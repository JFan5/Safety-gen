(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_05 - type_1
obj_11 obj_06 obj_04 obj_01 - type_3
obj_10 obj_03 obj_08 obj_07 - type_2
obj_02 obj_13 obj_12 - object)
(:init
(pred_3 obj_09 obj_03)
(pred_4 obj_09 obj_11)
(pred_4 obj_09 obj_06)
(pred_3 obj_05 obj_08)
(pred_4 obj_05 obj_04)
(pred_4 obj_05 obj_01)
(pred_2 obj_02 obj_03)
(pred_2 obj_13 obj_08)
(pred_2 obj_12 obj_03)
)
(:goal
(and
(pred_2 obj_02 obj_03)
(pred_2 obj_13 obj_07)
(pred_2 obj_12 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_08)))
)
)