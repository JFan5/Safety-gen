(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_02 - type_1
obj_04 obj_05 obj_01 obj_10 - type_3
obj_11 obj_03 obj_13 obj_07 - type_2
obj_06 obj_14 obj_12 obj_09 - object)
(:init
(pred_3 obj_08 obj_13)
(pred_4 obj_08 obj_04)
(pred_4 obj_08 obj_05)
(pred_3 obj_02 obj_07)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_10)
(pred_2 obj_06 obj_13)
(pred_2 obj_14 obj_03)
(pred_2 obj_12 obj_11)
(pred_2 obj_09 obj_07)
)
(:goal
(and
(pred_2 obj_06 obj_03)
(pred_2 obj_14 obj_07)
(pred_2 obj_12 obj_13)
(pred_2 obj_09 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_03)))
)
)