(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_13 - type_1
obj_02 obj_01 obj_07 obj_08 - type_2
obj_09 obj_12 obj_11 obj_10 - type_3
obj_06 obj_04 obj_05 obj_14 - object)
(:init
(pred_1 obj_03 obj_12)
(pred_3 obj_03 obj_02)
(pred_3 obj_03 obj_01)
(pred_1 obj_13 obj_10)
(pred_3 obj_13 obj_07)
(pred_3 obj_13 obj_08)
(pred_2 obj_06 obj_10)
(pred_2 obj_04 obj_10)
(pred_2 obj_05 obj_10)
(pred_2 obj_14 obj_11)
)
(:goal
(and
(pred_2 obj_06 obj_11)
(pred_2 obj_04 obj_11)
(pred_2 obj_05 obj_11)
(pred_2 obj_14 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_11)))
)
)