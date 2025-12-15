(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_09 - type_1
obj_01 obj_10 obj_12 obj_08 - type_3
obj_03 obj_02 obj_11 obj_07 - type_2
obj_13 obj_05 obj_04 obj_06 - object)
(:init
(pred_3 obj_14 obj_02)
(pred_4 obj_14 obj_01)
(pred_4 obj_14 obj_10)
(pred_3 obj_09 obj_02)
(pred_4 obj_09 obj_12)
(pred_4 obj_09 obj_08)
(pred_2 obj_13 obj_02)
(pred_2 obj_05 obj_07)
(pred_2 obj_04 obj_11)
(pred_2 obj_06 obj_11)
)
(:goal
(and
(pred_2 obj_13 obj_07)
(pred_2 obj_05 obj_11)
(pred_2 obj_04 obj_07)
(pred_2 obj_06 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_14 obj_11)))
)
)