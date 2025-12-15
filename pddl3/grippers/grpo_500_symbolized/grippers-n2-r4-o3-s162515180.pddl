(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_06 - type_1
obj_08 obj_10 obj_03 obj_13 - type_3
obj_01 obj_07 obj_11 obj_02 - type_2
obj_09 obj_12 obj_04 - object)
(:init
(pred_3 obj_05 obj_02)
(pred_4 obj_05 obj_08)
(pred_4 obj_05 obj_10)
(pred_3 obj_06 obj_02)
(pred_4 obj_06 obj_03)
(pred_4 obj_06 obj_13)
(pred_2 obj_09 obj_07)
(pred_2 obj_12 obj_07)
(pred_2 obj_04 obj_11)
)
(:goal
(and
(pred_2 obj_09 obj_07)
(pred_2 obj_12 obj_11)
(pred_2 obj_04 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_11)))
)
)