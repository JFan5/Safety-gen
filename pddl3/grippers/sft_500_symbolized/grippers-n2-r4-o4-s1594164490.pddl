(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_05 - type_3
obj_11 obj_08 obj_10 obj_06 - type_1
obj_12 obj_01 obj_07 obj_02 - type_2
obj_13 obj_03 obj_09 obj_04 - object)
(:init
(pred_1 obj_14 obj_07)
(pred_3 obj_14 obj_11)
(pred_3 obj_14 obj_08)
(pred_1 obj_05 obj_12)
(pred_3 obj_05 obj_10)
(pred_3 obj_05 obj_06)
(pred_2 obj_13 obj_01)
(pred_2 obj_03 obj_01)
(pred_2 obj_09 obj_12)
(pred_2 obj_04 obj_01)
)
(:goal
(and
(pred_2 obj_13 obj_02)
(pred_2 obj_03 obj_02)
(pred_2 obj_09 obj_07)
(pred_2 obj_04 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_14 obj_02)))
)
)