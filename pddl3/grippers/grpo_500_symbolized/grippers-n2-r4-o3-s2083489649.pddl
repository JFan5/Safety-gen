(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_02 - type_1
obj_07 obj_03 obj_04 obj_06 - type_3
obj_13 obj_01 obj_10 obj_08 - type_2
obj_05 obj_12 obj_11 - object)
(:init
(pred_4 obj_09 obj_01)
(pred_2 obj_09 obj_07)
(pred_2 obj_09 obj_03)
(pred_4 obj_02 obj_13)
(pred_2 obj_02 obj_04)
(pred_2 obj_02 obj_06)
(pred_3 obj_05 obj_13)
(pred_3 obj_12 obj_13)
(pred_3 obj_11 obj_01)
)
(:goal
(and
(pred_3 obj_05 obj_13)
(pred_3 obj_12 obj_08)
(pred_3 obj_11 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_10)))
)
)