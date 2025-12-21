(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_12 - type_1
obj_06 obj_03 obj_01 obj_11 - type_3
obj_08 obj_10 obj_02 obj_14 - type_2
obj_07 obj_05 obj_04 obj_09 - object)
(:init
(pred_4 obj_13 obj_14)
(pred_2 obj_13 obj_06)
(pred_2 obj_13 obj_03)
(pred_4 obj_12 obj_08)
(pred_2 obj_12 obj_01)
(pred_2 obj_12 obj_11)
(pred_3 obj_07 obj_08)
(pred_3 obj_05 obj_14)
(pred_3 obj_04 obj_02)
(pred_3 obj_09 obj_08)
)
(:goal
(and
(pred_3 obj_07 obj_14)
(pred_3 obj_05 obj_14)
(pred_3 obj_04 obj_10)
(pred_3 obj_09 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_13 obj_02)))
)
)