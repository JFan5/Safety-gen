(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_11 - type_1
obj_12 obj_03 obj_08 obj_01 - type_2
obj_10 obj_02 obj_07 obj_05 - type_3
obj_06 obj_04 obj_09 - object)
(:init
(pred_1 obj_13 obj_07)
(pred_3 obj_13 obj_12)
(pred_3 obj_13 obj_03)
(pred_1 obj_11 obj_02)
(pred_3 obj_11 obj_08)
(pred_3 obj_11 obj_01)
(pred_2 obj_06 obj_02)
(pred_2 obj_04 obj_02)
(pred_2 obj_09 obj_07)
)
(:goal
(and
(pred_2 obj_06 obj_05)
(pred_2 obj_04 obj_02)
(pred_2 obj_09 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_10)))
)
)